part of 'shake_animation_bloc.dart';

sealed class ShakeAnimationEvent extends Equatable {
  const ShakeAnimationEvent();

  @override
  List<Object> get props => [];
}

final class ShakeAnimationGetMusicPlayList extends ShakeAnimationEvent {
  final AudioPlayer audioPlayer;

  const ShakeAnimationGetMusicPlayList({required this.audioPlayer});
  @override
  List<Object> get props => [audioPlayer];
}
