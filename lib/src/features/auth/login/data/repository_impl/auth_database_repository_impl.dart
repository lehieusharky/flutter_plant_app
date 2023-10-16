import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/auth/login/data/data_sources/remote/auth_database_datasource.dart';
import 'package:plant_market/src/features/auth/login/domain/repositories/auth_database_repository.dart';

@Injectable(as: AuthenticationDataBaseRepository)
class AuthenticationDataBaseRepositoryImpl
    implements AuthenticationDataBaseRepository {
  final AuthenticationDataBaseDataSource _authenticationDataBaseDataSource;

  AuthenticationDataBaseRepositoryImpl(this._authenticationDataBaseDataSource);
  @override
  Future<Either<AuthDataBaseFailure, void>> createUserDataBase() async {
    try {
      final result =
          await _authenticationDataBaseDataSource.createUserDataBase();
      return Right(result);
    } catch (e) {
      return Left(AuthDataBaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthDataBaseFailure, bool>> isExist() async {
    try {
      final result = await _authenticationDataBaseDataSource.isExist();
      return Right(result);
    } catch (e) {
      return Left(AuthDataBaseFailure(message: e.toString()));
    }
  }
}
