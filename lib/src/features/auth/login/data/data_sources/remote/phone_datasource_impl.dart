import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/features/auth/login/data/data_sources/remote/phone_datasource.dart';

@Injectable(as: PhoneDataSource)
class PhoneDataSouceImpl implements PhoneDataSource {
  @override
  Future<void> sendOtp({
    required String phoneNumber,
    required void Function(String verificationId) pushToOtp,
  }) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        timeout: const Duration(seconds: 90),
        phoneNumber: '+84$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!
          // await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (String verificationId, int? resendToken) async {
          pushToOtp(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException {
      throw Exception('Login with phone number failed');
    }
  }

  @override
  Future<void> verifyOTP({
    required String verificationId,
    required String smsCode,
    required void Function()? onError,
  }) async {
    try {
      var credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException {
      onError!();
      throw Exception('OTP verification failed');
    }
  }
}
