import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/remote/user_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';

@Injectable(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  @override
  Future<UserModel?> getUserInfomation() async {
    try {
      final userId = firebaseAuth.currentUser!.uid;
      final userResponse = await firebaseFirestore
          .collection(AppConstant.usersCollection)
          .doc(userId)
          .get();

      if (userResponse.data() != null) {
        final userModel = UserModel.fromJson(userResponse.data()!);
        return userModel;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
