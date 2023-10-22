import 'package:flutter_test/flutter_test.dart';
import 'package:plant_market/src/features/shake_animation/domain/use_cases/remote_music_use_case.dart';

void main() {
  test(
    'Test music',
    () async {
      final listMusic = await remoteMusicUseCase.getMusicPlayList();
      expect(
        listMusic,
        [],
      );
    },
  );
}
