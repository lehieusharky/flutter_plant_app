import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:plant_market/src/features/shake_animation/domain/use_cases/remote_music_use_case.dart';

part 'shake_animation_event.dart';
part 'shake_animation_state.dart';

class ShakeAnimationBloc
    extends Bloc<ShakeAnimationEvent, ShakeAnimationState> {
  ShakeAnimationBloc() : super(ShakeAnimationInitial()) {
    on<ShakeAnimationGetMusicPlayList>(_getMusic);
  }

  Future<void> _getMusic(
    ShakeAnimationGetMusicPlayList event,
    Emitter<ShakeAnimationState> emit,
  ) async {
    try {
      final musicPlayList = await remoteMusicUseCase.getMusicPlayList();
      emit(ShakeAnimationGetMusicPlayListSuccess(musicPlayList: musicPlayList));
    } catch (e) {
      emit(ShakeAnimationFailure(message: e.toString()));
    }
  }
}
