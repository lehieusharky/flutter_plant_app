import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart';

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
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e);
    }
  }
}
