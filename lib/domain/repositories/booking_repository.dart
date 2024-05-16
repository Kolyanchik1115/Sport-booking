import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/booking/booking_response_model.dart';

abstract interface class BookingRepository {
  final GraphClient remoteClient;

  BookingRepository(this.remoteClient);

  Future<Either<Failure, BookingResponseModel>> getAllBookings({required int id});
  Future<Either<Failure, BookingResponseModel>> getBookings();
  Future<Either<Failure, BookingResponseModel>> createBooking({required int facilityId, required List<int> timeSlots});
}
