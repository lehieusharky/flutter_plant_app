import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_topic_event.dart';
part 'popular_topic_state.dart';

class PopularTopicBloc extends Bloc<PopularTopicEvent, PopularTopicState> {
  PopularTopicBloc() : super(PopularTopicInitial()) {
    on<PopularTopicEvent>((event, emit) {});
  }
}
