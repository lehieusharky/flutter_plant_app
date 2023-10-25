import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/domain/repositories/user_repository.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';

UserUseCase get userUseCase => injector.get<UserUseCase>();

abstract class UserUseCase {
  Future<UserModel?> getUserInfomation();
  Stream<UserModel?>? get userInformationStream;
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
  Future<UserModel?> getUserInfomation() async {
    try {
      final result = await _userRepository.getUserInfomation();
      return result.fold(
        (failure) {
          Logger().e('Get user infomation failed');
          return null;
        },
        (userModel) => userModel,
      );
    } catch (e) {
      throw UserFailure(message: e.toString());
    }
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
}
