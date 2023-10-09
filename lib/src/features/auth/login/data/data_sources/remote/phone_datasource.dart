abstract class PhoneDataSource {
  Future<void> sendOtp({
    required String phoneNumber,
    required void Function(String verificationId) pushToOtp,
  });

  Future<void> verifyOTP({
    required String verificationId,
    required String smsCode,
    required void Function()? onError,
  });
}