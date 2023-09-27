import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/data/models/regular_user_model.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/domain/failure.dart';

LoginWithGoogleRepository get loginWithGoogleRepository =>
    injector.get<LoginWithGoogleRepository>();

abstract class LoginWithGoogleRepository {
  Future<Either<LoginFailure, RegularUserModel>> loginWithGoogle();
}
