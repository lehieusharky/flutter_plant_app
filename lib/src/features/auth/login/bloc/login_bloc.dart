import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_market/src/core/data/models/regular_user_model.dart';
import 'package:plant_market/src/core/domain/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginWithGoogle>(_loginWithGoogle);
  }

  Future<void> _loginWithGoogle(
    LoginWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final result = await loginWithGoogleRepository.loginWithGoogle();
      result.fold(
        (failure) {
          emit(LoginFailure(message: failure.message));
        },
        (regularUser) => {
          emit(LoginSuccess(regularUser: regularUser)),
        },
      );
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
