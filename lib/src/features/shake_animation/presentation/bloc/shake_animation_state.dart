part of 'shake_animation_bloc.dart';

sealed class ShakeAnimationState extends Equatable {
  const ShakeAnimationState();

  @override
  List<Object> get props => [];
}

final class ShakeAnimationInitial extends ShakeAnimationState {}

final class ShakeAnimationGetMusicPlayListSuccess extends ShakeAnimationState {
  final List<String> musicPlayList;

  const ShakeAnimationGetMusicPlayListSuccess({required this.musicPlayList});

  @override
  List<Object> get props => [musicPlayList];
}

final class ShakeAnimationFailure extends ShakeAnimationState {
  final String message;

  const ShakeAnimationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
