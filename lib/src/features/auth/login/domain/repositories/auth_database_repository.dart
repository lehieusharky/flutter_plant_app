import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class AuthenticationDataBaseRepository {
  Future<Either<AuthDataBaseFailure, bool>> isExist();
  Future<Either<AuthDataBaseFailure, void>> createUserDataBase();
}
