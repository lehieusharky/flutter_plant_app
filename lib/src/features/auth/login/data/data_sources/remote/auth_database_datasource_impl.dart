import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/defines/enum/role.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/features/auth/login/data/data_sources/remote/auth_database_datasource.dart';
import 'package:plant_market/src/features/auth/login/data/models/user_model.dart';

@Injectable(as: AuthenticationDataBaseDataSource)
class AuthenticationDataBaseDataSourceImpl
    implements AuthenticationDataBaseDataSource {
  @override
  Future<bool> isExist() async {
    try {
      final isExist = (await firebaseFirestore
              .collection('users')
              .doc(firebaseAuth.currentUser!.uid)
              .get())
          .exists;
      return isExist;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> createUserDataBase() async {
    try {
      final user = _userInitial();
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .set(user.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  UserModel _userInitial() {
    return UserModel(
      userName: firebaseAuth.currentUser!.email,
      email: firebaseAuth.currentUser!.email,
      createAt: DateTime.now().toString(),
      id: firebaseAuth.currentUser!.uid,
      role: Role.regular,
    );
  }
}
