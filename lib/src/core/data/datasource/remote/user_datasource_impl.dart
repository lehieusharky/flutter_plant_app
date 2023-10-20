import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/datasource/remote/user_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/di/part_di.dart';

@Injectable(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  @override
  Future<UserModel?> getUserInfomation() async {
    try {
      final userResponse = await firebaseFirestore
          .collection(AppConstant.usersCollection)
          .doc(sharePreference.getUserId())
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
