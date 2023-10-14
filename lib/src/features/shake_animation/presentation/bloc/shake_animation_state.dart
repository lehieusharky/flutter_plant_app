part of 'shake_animation_bloc.dart';

sealed class ShakeAnimationState extends Equatable {
  const ShakeAnimationState();
  
  @override
  List<Object> get props => [];
}

final class ShakeAnimationInitial extends ShakeAnimationState {}
