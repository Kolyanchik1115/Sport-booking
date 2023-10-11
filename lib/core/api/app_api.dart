import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sport_app/data/models/user_response_model.dart';

class GraphClient {
  final GraphQLClient client;

  GraphClient(this.client);

  Future<UserResponseModel> signIn({required Map<String, dynamic> data}) async {
    String query = r'''
      mutation Login($loginInput: LoginDto!) {
        login(loginInput: $loginInput) {
          user {
            id
            email
            roles {
              value
            }
          }
        }
      }
    ''';
    final MutationOptions options = MutationOptions(
      document: gql(query),
      variables: data,
    );

    final QueryResult result = await client.mutate(options);

    final userData = result.data?['login']['user'];

    return UserResponseModel(
      id: userData['id'],
      email: userData['email'],
      roles: (userData['roles'] as List).map((role) => Role(value: role['value'])).toList(),
    );
  }
}
