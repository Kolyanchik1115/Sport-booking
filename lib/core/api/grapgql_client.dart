import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/data/models/booking/booking_response_model.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
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

  Future<UserResponseModel> googleSignIn({required Map<String, dynamic> data}) async {
    final queryResult = await sportAppApi.execute(query: googleLoginMutation, data: data, isMutation: true);
    return UserResponseModel.fromJson(queryResult);
  }

  Future<UserResponseModel> signUp({required Map<String, dynamic> data}) async {
    final queryResult = await sportAppApi.execute(query: registrationMutation, data: data, isMutation: true);
    return UserResponseModel.fromJson(queryResult);
  }

  Future<UserData> getProfile() async {
    final queryResult = await sportAppApi.execute(query: getProfileQuery);
    return UserData.fromJson(queryResult['getProfile']);
  }

  Future<UserData> updateUserData({required Map<String, dynamic> data}) async {
    final queryResult = await sportAppApi.execute(query: updateProfileMutation, data: data, isMutation: true);
    return UserData.fromJson(queryResult['updateProfile']);
  }

  Future<FacilityResponseModel> getAllFacility({required Map<String, dynamic> data}) async {
    final queryResult = await sportAppApi.execute(query: getAllFacilityQuery, data: data);
    return FacilityResponseModel.fromJson(queryResult);
  }

  Future<BookingResponseModel> getAllBooking({required Map<String, dynamic> data}) async {
    final queryResult = await sportAppApi.execute(query: getAllBookingQuery, data: data);
    return BookingResponseModel.fromJson(queryResult);
  }

  Future<BookingResponseModel> createBooking({required Map<String, dynamic> data}) async {
    final queryResult = await sportAppApi.execute(query: createBookingMutation, data: data, isMutation: true);
    return BookingResponseModel.fromJson(queryResult);
  }
}
