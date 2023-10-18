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
  Future<Either<UserFailure, UserModel?>> getUserInfomation() async {
    try {
      final userModel = await _userDataSource.getUserInfomation();
      return Right(userModel);
    } catch (e) {
      return Left(UserFailure(message: e.toString()));
    }
  }
}
