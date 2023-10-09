import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/features/auth/login/data/data_sources/remote/phone_datasource.dart';
import 'package:plant_market/src/features/auth/login/domain/repositories/phone_repository.dart';
import 'package:plant_market/src/core/failure/failure.dart';

@Injectable(as: PhoneRepository)
class PhoneRepositoryImpl implements PhoneRepository {
  final PhoneDataSource _phoneDataSource;

  PhoneRepositoryImpl(this._phoneDataSource);

  @override
  Future<Either<PhoneFailure, void>> sendOtp({
    required String phoneNumber,
    required void Function(String verificationId) pushToOtp,
  }) async {
    try {
      final result = await _phoneDataSource.sendOtp(
        phoneNumber: phoneNumber,
        pushToOtp: pushToOtp,
      );
      return Right(result);
    } catch (e) {
      return Left(PhoneFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<PhoneFailure, void>> verifyOTP({
    required String verificationId,
    required String smsCode,
    required void Function()? onError,
  }) async {
    try {
      final result = _phoneDataSource.verifyOTP(
        verificationId: verificationId,
        smsCode: smsCode,
        onError: onError,
      );
      return Right(result);
    } catch (e) {
      return Left(PhoneFailure(message: e.toString()));
    }
  }
}
