import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class GetWeatherParams extends NoParams {
  final String lat;
  final String lon;

  GetWeatherParams({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object> get props => [lat, lon];
}

class VerityOtpParams extends NoParams {
  final String verificationId;
  final String smsCode;
  final void Function()? onError;

  VerityOtpParams({
    required this.verificationId,
    required this.smsCode,
    this.onError,
  });
}

class SentOtpParams extends NoParams {
  final String phoneNumber;
  final void Function(String verificationId) pushToOtp;

  SentOtpParams({required this.phoneNumber, required this.pushToOtp});
}
