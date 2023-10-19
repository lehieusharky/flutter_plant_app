import 'dart:io';

import 'package:plant_market/src/features/user/data/models/time_line_model.dart';

abstract class TimeLineDataSource {
  Future<void> createTimeLine({required TimeLineModel timeLineModel});
  Future<String?> postImageOfTimeLine({required File image});
}
