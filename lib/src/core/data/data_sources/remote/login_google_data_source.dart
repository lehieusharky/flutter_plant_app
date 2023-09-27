import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/models/regular_user_model.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/extension/reg_exp.dart';

LoginWithGoogleDataSource get loginWithGoogleDataSource =>
    injector.get<LoginWithGoogleDataSource>();

abstract class LoginWithGoogleDataSource {
  Future<RegularUserModel> loginWithGoogle();
}

@Singleton(as: LoginWithGoogleDataSource)
class LoginWithGoogleDataSourceImpl implements LoginWithGoogleDataSource {
  @override
  Future<RegularUserModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final String email = userCredential.user!.email ?? '';
    return RegularUserModel(
        userName: email.getUserNameFromEmail(), email: email);
  }
}
