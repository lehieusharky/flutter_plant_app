import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/user/data/datasources/remote/timeline_datasource.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: TimeLineDataSource)
class TimeLineDataSourceImpl implements TimeLineDataSource {
  @override
  Future<void> createTimeLine({required TimeLineModel timeLineModel}) async {
    try {
      await firebaseFirestore
          .collection(AppConstant.usersCollection)
          .doc(sharePreference.getUserId())
          .collection(AppConstant.timeLineCollection)
          .doc(userInfo!.selectedPlantName)
          .collection('list_time_line')
          .doc(timeLineModel.timeLineId)
          .set(timeLineModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> createPlant({required String plantName}) async {
    try {
      final newListTimeLineRef = firebaseFirestore
          .collection(AppConstant.usersCollection)
          .doc(sharePreference.getUserId())
          .collection(AppConstant.timeLineCollection)
          .doc(plantName);

      userInfo!.listPlantName.add(plantName);
      final updateListPlantName = {"listPlantName": userInfo!.listPlantName};

      firebaseFirestore
          .collection(AppConstant.usersCollection)
          .doc(sharePreference.getUserId())
          .update(updateListPlantName);

      newListTimeLineRef.set({"name": plantName});
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> postImageOfTimeLine({required File image}) async {
    try {
      final ext = image.path.split('.').last;

      final imageRef = firebaseStorage.ref().child(
          'time_line/${sharePreference.getUserId()}/${userInfo!.selectedPlantName}/${const Uuid().v4()}.$ext');

      await imageRef.putFile(
          image, SettableMetadata(contentType: 'image/$ext'));

      return await imageRef.getDownloadURL();
    } catch (e) {
      throw Exception(e);
    }
  }

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      _listTimeLineSubscription;

  final StreamController<List<TimeLineModel>> _listTimeLineController =
      StreamController.broadcast();

  TimeLineDataSourceImpl() {
    final plantName = userInfo!.selectedPlantName;
    _listTimeLineSubscription = firebaseFirestore
        .collection(AppConstant.usersCollection)
        .doc(sharePreference.getUserId())
        .collection(AppConstant.timeLineCollection)
        .doc(plantName)
        .collection('list_time_line')
        .snapshots()
        .listen((timeLineSnapShot) {
      final listTimeLineModel = timeLineSnapShot.docs
          .map((data) => TimeLineModel.fromJson(data.data()))
          .toList();

      _listTimeLineController.add(listTimeLineModel);
    });
  }

  void close() {
    _listTimeLineSubscription?.cancel();
    _listTimeLineSubscription?.cancel();
  }

  @override
  Stream<List<TimeLineModel>> get listTimeLineStream =>
      _listTimeLineController.stream;

  @override
  Future<void> toggleSelectedPlant({required String plantName}) async {
    try {
      final updateSelectedPlantData = {"selectedPlantName": plantName};
      await firebaseFirestore
          .collection(AppConstant.usersCollection)
          .doc(sharePreference.getUserId())
          .update(updateSelectedPlantData);
    } catch (e) {
      throw Exception(e);
    }
  }
}
