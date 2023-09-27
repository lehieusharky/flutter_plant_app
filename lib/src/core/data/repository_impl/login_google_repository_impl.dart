import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/data_sources/remote/login_google_data_source.dart';
import 'package:plant_market/src/core/data/models/regular_user_model.dart';
import 'package:plant_market/src/core/domain/repositories/login_repository.dart';
import 'package:plant_market/src/core/domain/failure.dart';

@Injectable(as: LoginWithGoogleRepository)
class LoginWithGoogleRepositoryImpl implements LoginWithGoogleRepository {
  @override
  Future<Either<LoginFailure, RegularUserModel>> loginWithGoogle() async {
    try {
      final user = await loginWithGoogleDataSource.loginWithGoogle();
      return Right(user);
    } catch (e) {
      throw Left(LoginFailure(message: e.toString()));
    }
  }
}


// input 
/*** enum : 1 2 3 4 5
 *   sub enum : 1 : light dart
 * sub enum 2: //// .....
 *   
 * 
 * 
 * 
 */