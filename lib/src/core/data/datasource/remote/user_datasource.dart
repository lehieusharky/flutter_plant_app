import 'package:plant_market/src/core/data/models/user_model.dart';

abstract class UserDataSource {
  Stream<UserModel> get userInfomationStream;
   Future<bool> isExist();
  Future<void> createUserDataBase();
}
