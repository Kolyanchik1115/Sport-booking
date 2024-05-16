import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/booking/booking_response_model.dart';
import 'package:sport_app/domain/repositories/booking_repository.dart';

class GetBookingsUseCase implements UseCase<BookingResponseModel, NoParams> {
  final BookingRepository repository;

  GetBookingsUseCase(this.repository);

  @override
  Future<Either<Failure, BookingResponseModel>> call(NoParams params) async {
    return await repository.getBookings();
  }
}
