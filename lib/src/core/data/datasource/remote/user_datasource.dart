import 'package:plant_market/src/core/data/models/user_model.dart';

abstract class UserDataSource {
  Future<UserModel?> getUserInfomation();
}
