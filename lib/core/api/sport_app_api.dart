import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/injector.dart';

import 'gql/mutations.dart';

class SportAppApi {
  static const String baseUrl = "http://192.168.0.103:3000/graphql";
  late final GraphQLClient _graphqlClient;
  late final GraphQLClient _graphqlWithoutAuthLinkClient;
  String? _token;
  String? _refreshToken;

  SportAppApi() {
    _token = token;
    _configureGraphQLClient();
  }

  void _configureGraphQLClient() {
    final HttpLink httpLink = HttpLink(baseUrl);
    final AuthLink authLink = AuthLink(getToken: () async {
      if (_token == null || _token!.isEmpty) return "";
      if (Jwt.isExpired(_token!)) await updateToken();
      return 'Bearer $_token';
    });
    final Link link = authLink.concat(httpLink);
    _graphqlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
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

  Future<void> updateToken() async {
    log('Updating token...');
    final renewTokenResult = await _graphqlWithoutAuthLinkClient.mutate(MutationOptions(
      document: gql(refreshTokenMutation),
      variables: {"refresh": _refreshToken},
    ));
    final graphqlErrors = renewTokenResult.exception!.graphqlErrors;
    if (graphqlErrors.isNotEmpty) {
      injector<TokenStorage>().removeTokens();
      injector<AppRouter>().go(AppRoutes.singIn);
      log('Token update failed. Navigating to sign-in.');
    }
    final newToken = renewTokenResult.data?['accessToken'];
    token = newToken;
    log('Token updated successfully.');
  }

  Future<T> execute<T>({required String query, Map<String, dynamic>? data, bool isMutation = false}) async {
    log('Executing query/mutation: $query');

    final queryResult = isMutation
        ? await graphqlClient.mutate(MutationOptions(document: gql(query), variables: data ?? {}))
        // update: (GraphQLDataProxy cache, QueryResult result) {
        // return cache;
        // },
        : await graphqlClient.query(QueryOptions(document: gql(query)));
    // pollInterval: const Duration(seconds: 10),

    if (queryResult.hasException) {
      log('Query/mutation execution failed.');
      final graphqlErrors = queryResult.exception!.graphqlErrors;
      if (graphqlErrors.isNotEmpty) {
        for (final error in graphqlErrors) {
          log('GraphQL Error: ${error.message}');
          throw error.message;
        }
      }
    } else {
      log('Success.');
    }
    return queryResult.data! as T;
  }
}
