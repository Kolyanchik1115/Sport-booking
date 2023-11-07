import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';
import 'package:sport_app/injector.dart';

import 'gql/mutations.dart';
import 'gql/queries.dart';

class GraphClient {
  final SportAppApi graphqlApi;

  GraphClient(this.graphqlApi);


  Future<UserResponseModel> signIn({required Map<String, dynamic> data}) async {
    final queryResult = await graphqlApi.mutate(query: loginMutation, data: data);
    return UserResponseModel.fromJson(queryResult);
  }

  Future<UserData> getProfile() async {
    final queryResult = await graphqlApi.query(query: getProfileQuery);
    return UserData.fromJson(queryResult['getProfile']);
  }

}
