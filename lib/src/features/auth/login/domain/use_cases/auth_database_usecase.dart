import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/domain/repositories/auth_database_repository.dart';

AuthenticationDataBaseUseCase get authenticationDataBaseUseCase =>
    injector.get<AuthenticationDataBaseUseCase>();

abstract class AuthenticationDataBaseUseCase {
  Future<bool> isExist();
  Future<void> createUserDataBase();
}

@Injectable(as: AuthenticationDataBaseUseCase)
class AuthenticationDataBaseUseCaseImpl extends UseCase<void, NoParams>
    implements AuthenticationDataBaseUseCase {
  final AuthenticationDataBaseRepository _authenticationDataBaseRepository;

  AuthenticationDataBaseUseCaseImpl(this._authenticationDataBaseRepository);

  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Future<void> createUserDataBase() async {
    try {
      final result =
          await _authenticationDataBaseRepository.createUserDataBase();
      return result.fold(
        (failure) => Logger().e('Create new user db failed'),
        (success) => Logger().f('Create user db success'),
      );
    } catch (e) {
      throw AuthDataBaseFailure(message: e.toString());
    }
  }

  @override
  Future<bool> isExist() async {
    try {
      final result = await _authenticationDataBaseRepository.isExist();
      return result.fold(
        (failure) => false,
        (isExist) => isExist,
      );
    } catch (e) {
      throw AuthDataBaseFailure(message: e.toString());
    }
  }
}
