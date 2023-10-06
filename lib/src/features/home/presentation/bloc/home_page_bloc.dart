import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageChangetTopic>(_changeTopic);
  }

  Future<void> _changeTopic(
      HomePageChangetTopic event, Emitter<HomePageState> emit) async {
    try {
      emit(HomePageChangeTopicSuccess(topicSymbol: event.topicSymbol));
    } catch (e) {
      emit(HomePageFailure());
    }
  }
}
