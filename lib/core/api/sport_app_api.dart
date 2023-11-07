import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/injector.dart';

import 'gql/mutations.dart';

class SportAppApi {
  static const String baseUrl = "http://192.168.0.102:3000/graphql";
  late final GraphQLClient _graphqlClient;
  String? _token;
  String? _refreshToken;

  SportAppApi() {
    _configureGraphQLClient();
    _token = token;
  }

  void _configureGraphQLClient() {
    final HttpLink httpLink = HttpLink(baseUrl);
    final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
    final Link link = authLink.concat(httpLink);

    _graphqlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  GraphQLClient get graphqlClient => _graphqlClient;

  String? get token => _token;

  String? get refreshToken => _refreshToken;

  set token(String? value) {
    _token = value;
    injector<TokenStorage>().saveToken(_token!);
  }

  set refreshToken(String? value) {
    _refreshToken = value;
    if (_refreshToken != null) {
      injector<TokenStorage>().saveRefreshToken(_refreshToken!);
    }
  }

  Future<T> mutate<T>({required String query, required Map<String, dynamic> data}) async {
    final queryResult = await graphqlClient.mutate(MutationOptions(
      document: gql(query),
      variables: data,
    ));
    if (queryResult.hasException) {
      final message = queryResult.exception!.graphqlErrors.first.message;
      // final serverMessage = queryResult.exception!.linkException;
      if (message == "Unauthorized") {
        final storage = injector<TokenStorage>();

        final String token = await storage.getToken();
        final renewTokenResult = await graphqlClient.mutate(MutationOptions(
          document: gql(refreshTokenMutation),
          variables: {"refresh": token},
        ));
        final newToken = renewTokenResult.data?['accessToken'];
        _token = newToken;
        injector<TokenStorage>().saveToken(newToken!);
      }
    }
    return queryResult.data! as T;
  }

  Future<T> query<T>({required String query}) async {
    final queryResult = await graphqlClient.query(QueryOptions(
      document: gql(query),
    ));
    if (queryResult.hasException) {
      final message = queryResult.exception!.graphqlErrors.first.message;
      if (message == "Unauthorized") {
        final storage = injector<TokenStorage>();
        final String token = await storage.getRefreshToken();
        const Duration(seconds: 2);
        final renewTokenResult = await graphqlClient.mutate(MutationOptions(
          document: gql(refreshTokenMutation),
          variables: {"refresh": token},
        ));
        final newToken = renewTokenResult.data?['accessToken'];
        _token = newToken;
        injector<TokenStorage>().saveToken(newToken!);
      }
    }
    return queryResult.data! as T;
  }
}
