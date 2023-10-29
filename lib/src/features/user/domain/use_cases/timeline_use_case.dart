import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';
import 'package:plant_market/src/features/user/domain/repositories/timeline_repository.dart';

TimeLineUseCase get timeLineUseCase => injector.get<TimeLineUseCase>();

abstract class TimeLineUseCase {
  Future<void> createTimeLine({required TimeLineModel timeLineModel});
  Future<void> createPlant({required String plantName});
  Future<String?> postImageOfTimeLine({required File image});
  Future<void> toggleSelectedPlant({required String plantName});
  Future<List<TimeLineModel>> getListTimeLine({required String plantName});
}

@Injectable(as: TimeLineUseCase)
class TimeLineUseCaseImpl extends UseCase<void, TimeLineParams>
    implements TimeLineUseCase {
  final TimeLineRepository _timeLineRepository;

  TimeLineUseCaseImpl(this._timeLineRepository);
  @override
  Future<void> call(TimeLineParams params) {
    throw UnimplementedError();
  }

  @override
  Future<void> createTimeLine({required TimeLineModel timeLineModel}) async {
    try {
      final result = await _timeLineRepository.createTimeLine(
          timeLineModel: timeLineModel);
      return result.fold(
        (failure) => Logger().e('Create timeline falure'),
        (success) => Logger().f('create timeline success'),
      );
    } catch (e) {
      throw TimeLineFailure(message: e.toString());
    }
  }

  @override
  Future<void> createPlant({required String plantName}) async {
    try {
      final result =
          await _timeLineRepository.createPlant(plantName: plantName);
      return result.fold(
        (failure) => Logger().e('Create plant falure'),
        (success) => Logger().f('create plant success'),
      );
    } catch (e) {
      throw TimeLineFailure(message: e.toString());
    }
  }

  @override
  Future<String?> postImageOfTimeLine({required File image}) async {
    try {
      final result =
          await _timeLineRepository.postImageOfTimeLine(image: image);
      return result.fold(
        (failure) {
          Logger().e('post image falure');
          return null;
        },
        (imageUrl) => imageUrl,
      );
    } catch (e) {
      throw TimeLineFailure(message: e.toString());
    }
  }

  @override
  Future<void> toggleSelectedPlant({required String plantName}) async {
    try {
      final result =
          await _timeLineRepository.toggleSelectedPlant(plantName: plantName);
      return result.fold(
        (failure) => Logger().e('toggle plant name falure'),
        (success) => Logger().e('toggle plant name success'),
      );
    } catch (e) {
      throw TimeLineFailure(message: e.toString());
    }
  }

  @override
  Future<List<TimeLineModel>> getListTimeLine(
      {required String plantName}) async {
    try {
      final result =
          await _timeLineRepository.getListTimeLine(plantName: plantName);
      return result.fold(
        (failure) {
          Logger().e('get list timeline failed, ${failure.message}');
          return [];
        },
        (listTimeLine) => listTimeLine,
      );
    } catch (e) {
      throw TimeLineFailure(message: e.toString());
    }
  }
}
