import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/domain/use_cases/community_usecase.dart';

part 'community_search_event.dart';
part 'community_search_state.dart';

class CommunitySearchBloc
    extends Bloc<CommunitySearchEvent, CommunitySearchState> {
  CommunitySearchBloc() : super(CommunitySearchInitial()) {
    on<CommunitySearchGetListResult>(_getCommunitySearchResult);
  }

  Future<void> _getCommunitySearchResult(
    CommunitySearchGetListResult event,
    Emitter<CommunitySearchState> emit,
  ) async {
    try {
      final listCommunitySearch =
          await communityUseCase.getListCommunitySearchResult(
              getListCommunitySearchResultParam:
                  event.getListCommunitySearchResultParam);
      emit(CommunitySearchGetListSuccess(
          listCommunitySearch: listCommunitySearch));
    } catch (e) {
      emit(CommunitySearchFailure(message: e.toString()));
    }
  }
}
