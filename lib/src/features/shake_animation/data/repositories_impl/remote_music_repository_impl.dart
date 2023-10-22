import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/shake_animation/data/datasources/remote/music_datasource.dart';
import 'package:plant_market/src/features/shake_animation/domain/repositories/remote_music_repository.dart';

@Injectable(as: RemoteMusicRepository)
class RemoteMusicRepositoryImpl implements RemoteMusicRepository {
  final RemoteMusicDataSource _remoteMusicDataSource;

  RemoteMusicRepositoryImpl(this._remoteMusicDataSource);

  @override
  Future<Either<RemoteMusicFailure, List<String>>> getMusicPlayList() async {
    try {
      final musicPlayList = await _remoteMusicDataSource.getMusicPlayList();
      return Right(musicPlayList);
    } catch (e) {
      throw RemoteMusicFailure(message: e.toString());
    }
  }
}
