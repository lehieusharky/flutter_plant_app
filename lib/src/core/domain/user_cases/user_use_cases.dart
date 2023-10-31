import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/domain/repositories/user_repository.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';

UserUseCase get userUseCase => injector.get<UserUseCase>();

abstract class UserUseCase {
  Stream<UserModel?>? get userInformationStream;

  Future<bool> isExist();

  Future<void> createUserDataBase();

  Future<void> deleteUserDataBase();
}

@Injectable(as: UserUseCase)
class UserUseCaseImpl extends UseCase<void, NoParams> implements UserUseCase {
  final UserRepository _userRepository;

  UserUseCaseImpl(this._userRepository);

  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Stream<UserModel?>? get userInformationStream {
    try {
      final result = _userRepository.getUserInfomationStream();
      return result.fold(
        (failure) {
          Logger().e('Get user infomation stream failed ${failure.message}');
          return null;
        },
        (userModel) => userModel,
      );
    } catch (e) {
      throw UserFailure(message: e.toString());
    }
  }

  @override
  Future<void> createUserDataBase() async {
    try {
      final result = await _userRepository.createUserDataBase();
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
      final result = await _userRepository.isExist();
      return result.fold(
        (failure) => false,
        (isExist) => isExist,
      );
    } catch (e) {
      throw AuthDataBaseFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteUserDataBase() async {
    try {
      final result = await _userRepository.deleteUserDataBase();
      return result.fold(
        (failure) => Logger().e('delete account failed: ${failure.message}'),
        (success) => Logger().e('delete account success'),
      );
    } catch (e) {
      throw AuthDataBaseFailure(message: e.toString());
    }
  }
}
