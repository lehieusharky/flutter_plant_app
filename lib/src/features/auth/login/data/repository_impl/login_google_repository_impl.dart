import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/features/auth/login/data/data_sources/remote/login_google_datasource.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/auth/login/domain/repositories/login_repository.dart';

@Injectable(as: LoginWithGoogleRepository)
class LoginWithGoogleRepositoryImpl implements LoginWithGoogleRepository {
  final LoginWithGoogleDataSource _loginWithGoogleDataSource;

  LoginWithGoogleRepositoryImpl(this._loginWithGoogleDataSource);

  @override
  Future<Either<LoginFailure, void>> loginWithGoogle() async {
    try {
      final user = await _loginWithGoogleDataSource.loginWithGoogle();
      return Right(user);
    } catch (e) {
      throw Left(LoginFailure(message: e.toString()));
    }
  }
}
