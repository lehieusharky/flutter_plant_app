import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shake_animation_event.dart';
part 'shake_animation_state.dart';

class ShakeAnimationBloc extends Bloc<ShakeAnimationEvent, ShakeAnimationState> {
  ShakeAnimationBloc() : super(ShakeAnimationInitial()) {
    on<ShakeAnimationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
