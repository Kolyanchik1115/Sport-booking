import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/injector.dart';

part 'initial_state.dart';
part 'initial_cubit.freezed.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit() : super(const InitialState());

  Future<void> init() async {
    final storage = injector<TokenStorage>();


    final String token = await storage.getToken();
    final String refreshToken = await storage.getRefreshToken();

    if (token.isEmpty && refreshToken.isEmpty) {
      emit(state.copyWith(isAuth: false));
      return;
    }

    emit(state.copyWith(isAuth: true));
  }
}

