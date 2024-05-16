import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/booking/booking_response_model.dart';
import 'package:sport_app/domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  BookingRepositoryImpl(this.remoteClient);

  @override
  late final GraphClient remoteClient;

  @override
  Future<Either<Failure, BookingResponseModel>> getAllBookings({required int id}) async {
    try {
      final result = await remoteClient.getAllBooking(data: {"id": id});
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingResponseModel>> getBookings() async {
    try {
      final data = {
        "paginationArgs": {"limit": 10, "page": 1}
      };
      final result = await remoteClient.getAllBookings(data: data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingResponseModel>> createBooking(
      {required int facilityId, required List<int> timeSlots}) async {
    try {
      final result = await remoteClient.createBooking(data: {
        "createBookingInput": {
          "facilityId": facilityId,
          "timeSlotIds": timeSlots,
        }
      });
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
