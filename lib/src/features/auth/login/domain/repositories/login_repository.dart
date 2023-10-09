import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class LoginWithGoogleRepository {
  Future<Either<LoginFailure, void>> loginWithGoogle();
}
