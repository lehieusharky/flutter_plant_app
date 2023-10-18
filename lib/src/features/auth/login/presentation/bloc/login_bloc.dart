import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/domain/user_cases/user_use_cases.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/auth_database_usecase.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/login_google_usecase.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/phone_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginWithGoogle>(_loginWithGoogle);
    on<LoginSentOtp>(_sentOtp);
    on<LoginVerityOtp>(_verityOtp);
    on<LoginSetNotLoggedIn>(_setNotLoggedIn);
    on<LoginGetUserInfomation>(_getUserInfomation);

    add(LoginSetNotLoggedIn());
  }

  Future<void> _getUserInfomation(
    LoginGetUserInfomation event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final userModel = await userUseCase.getUserInfomation();
      if (userModel != null) {
        emit(LoginGetUserInfomationSuccess(userModel: userModel));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<void> _setNotLoggedIn(
    LoginSetNotLoggedIn event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await sharePreference.setIsLoggedIn(status: false);
    } catch (e) {
      emit(LoginSentOtpFailure(message: e.toString()));
    }
  }

  Future<void> _sentOtp(
    LoginSentOtp event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await phoneUseCase.sentOtp(sentOtpParams: event.sentOtpParams);

      emit(LoginSentOtpSuccess());
    } catch (e) {
      emit(LoginSentOtpFailure(message: e.toString()));
    }
  }

  Future<void> _verityOtp(
    LoginVerityOtp event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await phoneUseCase.verifyOTP(verityOtpParams: event.verityOtpParams);
      await _createUserDataBase(emit);

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginVerifyOtpFailure(message: e.toString()));
    }
  }

  Future<void> _loginWithGoogle(
    LoginWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await loginWithGoogleUseCase.call(NoParams());
      await _createUserDataBase(emit);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginWithGoogleFailure(message: e.toString()));
    }
  }

  Future<void> _createUserDataBase(Emitter<LoginState> emit) async {
    try {
      await sharePreference.setIsLoggedIn(status: true);
      final isExist = await authenticationDataBaseUseCase.isExist();
      if (!isExist) {
        await authenticationDataBaseUseCase.createUserDataBase();
      }
    } catch (e) {
      emit(LoginWithGoogleFailure(message: e.toString()));
    }
  }
}
