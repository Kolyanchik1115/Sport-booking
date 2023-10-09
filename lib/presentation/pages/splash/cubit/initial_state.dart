part of 'initial_cubit.dart';

class InitialState extends Equatable {
  final bool isAuth;

  const InitialState({
    this.isAuth = false,
  });

  InitialState copyWith({
    bool? isAuth,
  }) {
    return InitialState(
      isAuth: isAuth ?? this.isAuth,
    );
  }

  @override
  List<Object?> get props => [isAuth];
}
