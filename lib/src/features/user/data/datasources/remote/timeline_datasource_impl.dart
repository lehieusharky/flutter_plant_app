import 'dart:io';

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
          .doc(timeLineModel.timeLineId)
          .set(timeLineModel.toJson());
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
}
