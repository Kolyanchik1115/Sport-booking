import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'initial_state.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit() : super(const InitialState());

  void init() {
    emit(state.copyWith(isAuth: true));
  }
}
