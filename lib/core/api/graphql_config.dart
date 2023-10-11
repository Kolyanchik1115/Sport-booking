import 'package:graphql_flutter/graphql_flutter.dart';

class SportAppApi {
  static HttpLink httpLink = HttpLink(
    "http://192.168.0.103:3000/graphql",
  );

  GraphQLClient clientToQuery() => GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      );


}
