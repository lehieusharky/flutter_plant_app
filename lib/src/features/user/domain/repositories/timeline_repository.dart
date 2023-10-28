import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';

abstract class TimeLineRepository {
  Future<Either<TimeLineFailure, void>> createTimeLine(
      {required TimeLineModel timeLineModel});

  Future<Either<TimeLineFailure, String?>> postImageOfTimeLine(
      {required File image});

  Future<Either<TimeLineFailure, void>> toggleSelectedPlant(
      {required String plantName});

  Future<Either<TimeLineFailure, void>> createPlant(
      {required String plantName});

  Either<TimeLineFailure, Stream<List<TimeLineModel>>> listTimeLineStream();
}
