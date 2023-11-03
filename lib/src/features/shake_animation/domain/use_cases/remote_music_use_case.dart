import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/shake_animation/domain/repositories/remote_music_repository.dart';

RemoteMusicUseCase get remoteMusicUseCase => injector.get<RemoteMusicUseCase>();

abstract class RemoteMusicUseCase {
  Future<List<String>> getMusicPlayList();
}

@Injectable(as: RemoteMusicUseCase)
class RemoteMusicUseCaseImpl extends UseCase<void, NoParams>
    implements RemoteMusicUseCase {
  final RemoteMusicRepository _remoteMusicRepository;

  RemoteMusicUseCaseImpl(this._remoteMusicRepository);

  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getMusicPlayList() async {
    try {
      final result = await _remoteMusicRepository.getMusicPlayList();
      return result.fold(
        (failure) {
         
          return [];
        },
        (musicPlayList) => musicPlayList,
      );
    } catch (e) {
      throw RemoteMusicFailure(message: e.toString());
    }
  }
}
