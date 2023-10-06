import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/login_google_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithGoogleUseCase _loginWithGoogleUseCase =
      LoginWithGoogleUseCase();

  LoginBloc() : super(LoginInitial()) {
    on<LoginWithGoogle>(_loginWithGoogle);
  }

  Future<void> _loginWithGoogle(
    LoginWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _loginWithGoogleUseCase.call(NoParams());
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
