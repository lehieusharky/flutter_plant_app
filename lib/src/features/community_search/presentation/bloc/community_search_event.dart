part of 'community_search_bloc.dart';

sealed class CommunitySearchEvent extends Equatable {
  const CommunitySearchEvent();

  @override
  List<Object> get props => [];
}

final class CommunitySearchGetListResult extends CommunitySearchEvent {
  final GetListCommunitySearchResultParam getListCommunitySearchResultParam;

  const CommunitySearchGetListResult(
      {required this.getListCommunitySearchResultParam});

  @override
  List<Object> get props => [getListCommunitySearchResultParam];
}
