import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/domain/repositories/phone_repository.dart';

PhoneUseCase get phoneUseCase => injector.get<PhoneUseCase>();

abstract class PhoneUseCase {
  Future<void> sentOtp({required SentOtpParams sentOtpParams});

  Future<void> verifyOTP({required VerityOtpParams verityOtpParams});
}

@Injectable(as: PhoneUseCase)
class PhoneUsecaseimpl extends UseCase<void, NoParams> implements PhoneUseCase {
  final PhoneRepository _phoneRepository;

  PhoneUsecaseimpl(this._phoneRepository);
  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Future<void> sentOtp({required SentOtpParams sentOtpParams}) async {
    try {
      final result = await _phoneRepository.sendOtp(
          phoneNumber: sentOtpParams.phoneNumber,
          pushToOtp: sentOtpParams.pushToOtp);
      result.fold(
        (failure) => Logger().e(failure.message),
        (success) => Logger().d('sent otp success'),
      );
    } catch (e) {
      throw PhoneFailure(message: e.toString());
    }
  }

  @override
  Future<void> verifyOTP({required VerityOtpParams verityOtpParams}) async {
    try {
      final result = await _phoneRepository.verifyOTP(
          verificationId: verityOtpParams.verificationId,
          smsCode: verityOtpParams.smsCode,
          onError: verityOtpParams.onError);

      result.fold(
        (failure) => Logger().e(failure.message),
        (success) => Logger().d('verify otp success'),
      );
    } catch (e) {
      throw PhoneFailure(message: e.toString());
    }
  }
}
