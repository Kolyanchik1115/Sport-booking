import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';

import 'gql/mutations.dart';
import 'gql/queries.dart';

class GraphClient {
  final SportAppApi graphqlApi;

  GraphClient(this.graphqlApi);

  MutationOptions mutationOptions(String query, Map<String, dynamic> data) {
    return MutationOptions(
      document: gql(query),
      variables: data,
    );
  }

  QueryOptions queryOption(String query) {
    return QueryOptions(
      document: gql(query),
    );
  }

  Future<UserResponseModel> signIn({required Map<String, dynamic> data}) async {
    final queryResult = await graphqlApi.graphqlClient.mutate(mutationOptions(loginMutation, data));
    return UserResponseModel.fromJson(queryResult.data!);
  }

  Future<UserData> getProfile() async {
    final queryResult = await graphqlApi.graphqlClient.query(queryOption(getProfileQuery));
    return UserData.fromJson(queryResult.data?['getProfile']);
  }
}
