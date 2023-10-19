import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/user/data/datasources/remote/timeline_datasource.dart';
import 'package:plant_market/src/features/user/data/models/time_line_model.dart';
import 'package:plant_market/src/features/user/domain/repositories/timeline_repository.dart';

@Injectable(as: TimeLineRepository)
class TimeLineRepositoryImpl implements TimeLineRepository {
  final TimeLineDataSource _timeLineDataSource;

  TimeLineRepositoryImpl(this._timeLineDataSource);
  @override
  Future<Either<TimeLineFailure, void>> createTimeLine(
      {required TimeLineModel timeLineModel}) async {
    try {
      final result = await _timeLineDataSource.createTimeLine(
          timeLineModel: timeLineModel);
      return Right(result); 
    } catch (e) {
      return Left(TimeLineFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<TimeLineFailure, String?>> postImageOfTimeLine(
      {required File image}) async {
    try {
      final result =
          await _timeLineDataSource.postImageOfTimeLine(image: image);
      return Right(result);
    } catch (e) {
      return Left(TimeLineFailure(message: e.toString()));
    }
  }
}
