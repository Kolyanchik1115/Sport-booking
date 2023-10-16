import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/injector.dart';

class SportAppApi {
  static const String baseUrl = "http://192.168.0.101:3000/graphql";
  late final GraphQLClient _graphqlClient;
  String? _token;
  String? _refreshToken;

  SportAppApi() {
    final HttpLink httpLink = HttpLink(
      baseUrl,
    );
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );

    final Link link = authLink.concat(httpLink);

    final GraphQLClient graphqlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );

    _graphqlClient = graphqlClient;

    _token = token;
  }

  GraphQLClient get graphqlClient => _graphqlClient;

  String? get token => _token;

  String? get refreshToken => _refreshToken;



  set token(String? value) {
    _token = value;
    if (_token != null) injector<TokenStorage>().saveToken(_token!);
  }

  set refreshToken(String? value) {
    _refreshToken = value;
    if (_refreshToken != null) injector<TokenStorage>().saveRefreshToken(_refreshToken!);
  }
}
