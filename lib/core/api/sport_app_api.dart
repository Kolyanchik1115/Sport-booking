import 'dart:developer';
import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/injector.dart';

import 'gql/mutations.dart';

class SportAppApi {
  static String get baseUrl {
    return Platform.isIOS ? "http://127.0.0.1:3000/graphql" : "http://10.0.2.2:3000/graphql";
  }

  static String get imageUrl {
    return Platform.isIOS ? "http://127.0.0.1:3000" : "http://10.0.2.2:3000";
  }

  String imageFromDB(String path) => '$imageUrl/$path';

  late final GraphQLClient _graphqlClient;
  late final GraphQLClient _graphqlWithoutAuthLinkClient;
  String? _token;
  String? _refreshToken;

  SportAppApi() {
    _token = token;
    _configureGraphQLClient();
  }

  void _configureGraphQLClient() {
    final HttpLink httpLink = HttpLink(baseUrl, defaultHeaders: {
      'Content-Type': 'application/json; charset=utf-8',
      'X-Apollo-Operation-Name': 'post',
    });
    final AuthLink authLink = AuthLink(
      getToken: () async {
        if (_token == null || _token!.isEmpty) return "";
        if (Jwt.isExpired(_token!)) await _updateToken();

        return 'Bearer $_token';
      },
    );

    final Link link = authLink.concat(httpLink);
    _graphqlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
    _graphqlWithoutAuthLinkClient = GraphQLClient(link: httpLink, cache: GraphQLCache());
  }

  GraphQLClient get graphqlClient => _graphqlClient;

  String? get token => _token;

  String? get refreshToken => _refreshToken;

  set token(String? value) {
    _token = value;
    injector<TokenStorage>().saveToken(_token!);
    log('Token: $_token');
  }

  set refreshToken(String? value) {
    _refreshToken = value;
    if (_refreshToken != null) {
      injector<TokenStorage>().saveRefreshToken(_refreshToken!);
    }
    log('Refresh token: $_refreshToken');
  }

  Future<void> _updateToken() async {
    log('Updating token...');
    try {
      final renewTokenResult = await _graphqlWithoutAuthLinkClient.mutate(MutationOptions(
        document: gql(refreshTokenMutation),
        variables: {"refresh": _refreshToken},
      ));
      final newToken = renewTokenResult.data?['accessToken'];
      token = newToken;
      log('Token updated successfully.');
    } catch (_) {
      injector<TokenStorage>().removeTokens();
      injector<AppRouter>().go(AppRoutes.signIn);
      log('Token update failed. Navigating to sign-in.');
      throw "Something went wrong";
    }
  }

  Future<T> execute<T>({required String query, Map<String, dynamic>? data, bool isMutation = false}) async {
    log('Executing query/mutation: $query');
    final queryResult = isMutation
        ? await graphqlClient.mutate(MutationOptions(
        document: gql(query),
        variables: data ?? {},
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.noCache,
        onError: (err) => throw GraphQLError(message: err!.graphqlErrors.first.message)))
    // update: (GraphQLDataProxy cache, QueryResult result) {
    // return cache;
    // },
        : await graphqlClient.query(QueryOptions(
        document: gql(query),
        variables: data ?? {},
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.noCache,
        onError: (err) => throw GraphQLError(message: err!.graphqlErrors.first.message)));
    // pollInterval: const Duration(seconds: 10),
    if (queryResult.hasException) {
      log('Query/mutation execution failed.');
      // await _updateToken();
    }
    return queryResult.data! as T;
  }
}
