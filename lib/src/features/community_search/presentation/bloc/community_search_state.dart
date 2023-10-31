part of 'community_search_bloc.dart';

sealed class CommunitySearchState extends Equatable {
  const CommunitySearchState();

  @override
  List<Object> get props => [];
}

final class CommunitySearchInitial extends CommunitySearchState {}

final class CommunitySearchGetListSuccess extends CommunitySearchState {
  final List<CommunityPostModel> listCommunitySearch;

  const CommunitySearchGetListSuccess({required this.listCommunitySearch});
  @override
  List<Object> get props => [listCommunitySearch];
}

final class CommunitySearchFailure extends CommunitySearchState {
  final String message;

  const CommunitySearchFailure({required this.message});
  @override
  List<Object> get props => [message];
}
