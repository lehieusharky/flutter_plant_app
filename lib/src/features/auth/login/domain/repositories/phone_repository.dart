import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class PhoneRepository {
  Future<Either<PhoneFailure, void>> sendOtp({
    required String phoneNumber,
    required void Function(String verificationId) pushToOtp,
  });

  Future<Either<PhoneFailure, void>> verifyOTP({
    required String verificationId,
    required String smsCode,
    required void Function()? onError,
  });
}
