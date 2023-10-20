import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/domain/repositories/user_repository.dart';

class GetCurrentUserUseCase implements UseCase<UserData, NoParams> {
  final UserRepository repository;

  GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserData>> call(NoParams params) async {
    return await repository.getUser();
  }
}
