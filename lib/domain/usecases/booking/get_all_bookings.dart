import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/booking/booking_response_model.dart';
import 'package:sport_app/domain/repositories/booking_repository.dart';

class GetAllBookingsUseCase implements UseCase<BookingResponseModel, GetAllBookingsParams> {
  final BookingRepository repository;

  GetAllBookingsUseCase(this.repository);

  @override
  Future<Either<Failure, BookingResponseModel>> call(GetAllBookingsParams params) async {
    return await repository.getAllBookings(id: params.id);
  }
}

class GetAllBookingsParams extends Equatable {
  final int id;

  const GetAllBookingsParams({required this.id});

  @override
  List<Object?> get props => [id];
}
