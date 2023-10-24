import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/features/user/data/datasources/remote/timeline_datasource.dart';
import 'package:plant_market/src/features/user/data/models/time_line_model.dart';
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
          .doc('Tree_test')
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

      newListTimeLineRef.set({"name": plantName});
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> postImageOfTimeLine({required File image}) async {
    try {
      final ext = image.path.split('.').last;
      const plantName = 'HoaHong';

      final imageRef = firebaseStorage.ref().child(
          'time_line/${sharePreference.getUserId()}/$plantName/${const Uuid().v4()}.$ext');

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
    _listTimeLineSubscription = firebaseFirestore
        .collection(AppConstant.usersCollection)
        .doc(sharePreference.getUserId())
        .collection(AppConstant.timeLineCollection)
        .doc('HoaHong')
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
  }

  @override
  Stream<List<TimeLineModel>> get listTimeLineStream =>
      _listTimeLineController.stream;
}
