import 'dart:developer';
import 'package:plant_market/src/core/exceptions/login_exception.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/failure.dart';
import 'package:plant_market/src/features/auth/login/domain/repositories/login_repository.dart';

class LoginWithGoogleUseCase implements UseCase<void, NoParams> {
  @override
  Future<void> call(NoParams params) async {
    try {
      final result = await loginWithGoogleRepository.loginWithGoogle();
      return result.fold(
        (failure) => LoginFailure(message: failure.toString()),
        (success) => log('login success'),
      );
    } catch (e) {
      throw LoginException(message: e.toString());
    }
  }
}
