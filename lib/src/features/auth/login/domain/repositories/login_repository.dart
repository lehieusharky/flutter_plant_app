import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/failure.dart';

LoginWithGoogleRepository get loginWithGoogleRepository =>
    injector.get<LoginWithGoogleRepository>();

abstract class LoginWithGoogleRepository {
  Future<Either<LoginFailure, void>> loginWithGoogle();
}
