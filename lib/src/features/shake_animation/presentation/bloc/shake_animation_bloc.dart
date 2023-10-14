import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shake_animation_event.dart';
part 'shake_animation_state.dart';

class ShakeAnimationBloc
    extends Bloc<ShakeAnimationEvent, ShakeAnimationState> {
  ShakeAnimationBloc() : super(ShakeAnimationInitial()) {
    on<ShakeAnimationEvent>((event, emit) {});
  }
}
