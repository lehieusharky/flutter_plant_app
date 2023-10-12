import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/setting/domain/repositories/log_out_repository.dart';

LogOutUseCase get logOutUseCase => injector.get<LogOutUseCase>();

abstract class LogOutUseCase {
  Future<void> logOut();
}

@Injectable(as: LogOutUseCase)
class LogOutUseCaseImpl extends UseCase<void, NoParams>
    implements LogOutUseCase {
  final LogOutRepository _logOutRepository;

  LogOutUseCaseImpl(this._logOutRepository);

  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    try {
      final result = await _logOutRepository.logOut();
      result.fold(
        (failure) => Logger().e('Log out failed'),
        (success) => Logger().d('Log out success'),
      );
    } catch (e) {
      throw LogOutFailure(message: e.toString());
    }
  }
}
