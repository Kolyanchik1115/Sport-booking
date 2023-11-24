import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/domain/repositories/user_repository.dart';

class UpdateUserUseCase implements UseCase<UserData, UpdateUserParams> {
  final UserRepository repository;

  UpdateUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserData>> call(UpdateUserParams params) async => await repository.updateUserProfile(
        fullname: params.fullname,
        dateOfBirth: params.dateOfBirth,
        avatar: params.avatar,
      );
}

class UpdateUserParams extends Equatable {
  final String? fullname;
  final DateTime? dateOfBirth;
  final File? avatar;

  const UpdateUserParams({
    required this.fullname,
    required this.dateOfBirth,
    required this.avatar,
  });

  @override
  List<Object?> get props => [fullname, avatar, dateOfBirth];
}
