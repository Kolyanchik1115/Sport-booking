import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';

import 'gql/mutations.dart';
import 'gql/queries.dart';

class GraphClient {
  final SportAppApi sportAppApi;

  GraphClient(this.sportAppApi);

  Future<UserResponseModel> signIn({required Map<String, dynamic> data}) async {
    final queryResult = await sportAppApi.execute(query: loginMutation, data: data, isMutation: true);
    return UserResponseModel.fromJson(queryResult);
  }

  Future<UserData> getProfile() async {
    final queryResult = await sportAppApi.execute(query: getProfileQuery);
    return UserData.fromJson(queryResult['getProfile']);
  }
}
