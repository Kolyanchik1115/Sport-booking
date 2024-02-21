import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/booking/booking_response_model.dart';
import 'package:sport_app/domain/repositories/booking_repository.dart';

class CreateBookingUseCase implements UseCase<BookingResponseModel, CreateBookingParams> {
  final BookingRepository repository;

  CreateBookingUseCase(this.repository);

  @override
  Future<Either<Failure, BookingResponseModel>> call(CreateBookingParams params) async {
    return await repository.createBooking(facilityId: params.facilityId, timeSlots: params.timeSlots);
  }
}

class CreateBookingParams extends Equatable {
  final int facilityId;
  final List<int> timeSlots;

  const CreateBookingParams({required this.facilityId, required this.timeSlots});

  @override
  List<Object?> get props => [facilityId, timeSlots];
}
