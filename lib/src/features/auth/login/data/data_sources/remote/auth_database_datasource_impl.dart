import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/defines/enum/role.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/features/auth/login/data/data_sources/remote/auth_database_datasource.dart';

@Injectable(as: AuthenticationDataBaseDataSource)
class AuthenticationDataBaseDataSourceImpl
    implements AuthenticationDataBaseDataSource {
  @override
  Future<bool> isExist() async {
    try {
      final isExist = (await firebaseFirestore
              .collection(AppConstant.usersCollection)
              .doc(sharePreference.getUserId())
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
          .collection(AppConstant.usersCollection)
          .doc(sharePreference.getUserId())
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
      listPostId: const [],
      listPlantName: const [],
    );
  }
}
