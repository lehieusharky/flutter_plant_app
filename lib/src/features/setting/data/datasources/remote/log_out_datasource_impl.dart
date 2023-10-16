import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/setting/data/datasources/remote/log_out_datasource.dart';

@Injectable(as: LogOutDataSource)
class LogOutDataSourceImpl implements LogOutDataSource {
  @override
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      throw LoginFailure(message: 'Log out failed');
    }
  }
}
