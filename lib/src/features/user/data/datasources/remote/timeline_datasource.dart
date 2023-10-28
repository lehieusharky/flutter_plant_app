import 'dart:io';

import 'package:plant_market/src/features/user/data/models/timeline_model.dart';

abstract class TimeLineDataSource {
  Future<void> createTimeLine({required TimeLineModel timeLineModel});
  Future<void> createPlant({required String plantName});
  Future<void> toggleSelectedPlant({required String plantName});
  Future<String?> postImageOfTimeLine({required File image});
  Stream<List<TimeLineModel>> get listTimeLineStream;
}
