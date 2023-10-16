import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/features/auth/login/data/data_sources/remote/login_google_datasource.dart';

@Injectable(as: LoginWithGoogleDataSource)
class LoginWithGoogleDataSourceImpl implements LoginWithGoogleDataSource {
  @override
  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      await sharePreference.setIsLoggedIn(status: true);
    } catch (e) {
      throw Exception(e);
    }
  }
}
