import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/setting/data/datasources/remote/log_out_datasource.dart';
import 'package:plant_market/src/features/setting/domain/repositories/log_out_repository.dart';

@Injectable(as: LogOutRepository)
class LogOutRepositoryImpl implements LogOutRepository {
  final LogOutDataSource _logOutDataSource;

  LogOutRepositoryImpl(this._logOutDataSource);

  @override
  Future<Either<LogOutFailure, void>> logOut() async {
    try {
      final result = await _logOutDataSource.logOut();
      return Right(result);
    } catch (e) {
      return Left(LogOutFailure(message: e.toString()));
    }
  }
}
