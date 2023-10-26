import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/remote/user_datasource.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/domain/repositories/user_repository.dart';
import 'package:plant_market/src/core/failure/failure.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Either<UserFailure, Stream<UserModel>> getUserInfomationStream() {
    try {
      final result = _userDataSource.userInfomationStream;
      return Right(result);
    } catch (e) {
      return Left(UserFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthDataBaseFailure, void>> createUserDataBase() async {
    try {
      final result = await _userDataSource.createUserDataBase();
      return Right(result);
    } catch (e) {
      return Left(AuthDataBaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthDataBaseFailure, bool>> isExist() async {
    try {
      final result = await _userDataSource.isExist();
      return Right(result);
    } catch (e) {
      return Left(AuthDataBaseFailure(message: e.toString()));
    }
  }
}
