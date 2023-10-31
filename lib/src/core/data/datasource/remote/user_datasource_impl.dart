import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/datasource/remote/user_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/defines/enum/role.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/di/part_di.dart';

@Injectable(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      _userInfomationSubscription;

  final StreamController<UserModel> _userModelStreamController =
      StreamController.broadcast();

  UserDataSourceImpl() {
    _userInfomationSubscription = firebaseFirestore
        .collection(AppConstant.usersCollection)
        .doc(sharePreference.getUserId())
        .snapshots()
        .listen((userInfoSnapShot) {
      if (userInfoSnapShot.data() != null) {
        final userModel = UserModel.fromJson(userInfoSnapShot.data()!);
        _userModelStreamController.add(userModel);
      }
    });
  }

  void close() {
    _userInfomationSubscription?.cancel();
  }

  @override
  Stream<UserModel> get userInfomationStream =>
      _userModelStreamController.stream;

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
      listPlantName: const ["Example plant"],
      selectedPlantName: 'Example plant',
      listFavoriteCommunityPost: const [],
    );
  }
}
