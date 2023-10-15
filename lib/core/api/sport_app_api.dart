import 'package:graphql_flutter/graphql_flutter.dart';

class SportAppApi {
  static HttpLink httpLink = HttpLink(
    "http://192.168.0.100:3000/graphql",
  );

  SportAppApi() {
    final graphqlClient = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );

    _graphqlClient = graphqlClient;
  }

  late final GraphQLClient _graphqlClient;

  GraphQLClient get graphqlClient => _graphqlClient;

}
