import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_state.dart';
part 'initial_cubit.freezed.dart';


class InitialCubit extends Cubit<InitialState> {
  InitialCubit() : super(const InitialState());

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isAuth: true));
  }
}
