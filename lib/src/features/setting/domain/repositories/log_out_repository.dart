import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class LogOutRepository {
  Future<Either<LogOutFailure, void>> logOut();
}
