import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/exceptions/login_exception.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/domain/repositories/login_repository.dart';

LoginWithGoogleUseCase get loginWithGoogleUseCase =>
    injector.get<LoginWithGoogleUseCase>();

abstract class LoginWithGoogleUseCase {
  Future<void> call(NoParams params);
}

@Injectable(as: LoginWithGoogleUseCase)
class LoginWithGoogleUseCaseImpl extends UseCase<void, NoParams>
    implements LoginWithGoogleUseCase {
  final LoginWithGoogleRepository _loginWithGoogleRepository;

  LoginWithGoogleUseCaseImpl(this._loginWithGoogleRepository);
  @override
  Future<void> call(NoParams params) async {
    try {
      final result = await _loginWithGoogleRepository.loginWithGoogle();
      return result.fold((failure) => {}, (success) => {});
    } catch (e) {
      throw LoginException(message: e.toString());
    }
  }
}
