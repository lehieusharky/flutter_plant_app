import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/data/models/regular_user_model.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/domain/repositories/login_repository.dart';
import 'package:plant_market/src/core/domain/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';

class LoginGoogleUseCase1 implements UseCase<RegularUserModel, NoParams> {
  @override
  Future<Either<Failure, RegularUserModel>> call(NoParams params) {
    return injector.get<LoginWithGoogleRepository>().loginWithGoogle();
  }
}
