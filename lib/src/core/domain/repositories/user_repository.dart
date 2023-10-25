import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class UserRepository {
  Either<UserFailure, Stream<UserModel>> getUserInfomationStream();
  Future<Either<UserFailure, UserModel?>> getUserInfomation();
}
