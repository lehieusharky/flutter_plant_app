import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class RemoteMusicRepository {
  Future<Either<RemoteMusicFailure, List<String>>> getMusicPlayList();
}
