import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/features/community_search/presentation/bloc/community_search_bloc.dart';
import 'package:plant_market/src/features/community_search/presentation/widgets/search_item.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';

class ListCommunitySearchResult extends StatefulWidget {
  const ListCommunitySearchResult({super.key});

  @override
  State<ListCommunitySearchResult> createState() =>
      _ListCommunitySearchResultState();
}

class _ListCommunitySearchResultState extends State<ListCommunitySearchResult> {
  List<CommunityPostModel> _listCommunityPost = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunitySearchBloc, CommunitySearchState>(
      listener: (context, state) {
        if (state is CommunitySearchGetListSuccess) {
          _listCommunityPost = state.listCommunitySearch;
        }
      },
      builder: (context, state) {
        if (_listCommunityPost.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _listCommunityPost.length,
            itemBuilder: (context, index) {
              return SearchItem(
                communityPostModel: _listCommunityPost.reversed.toList()[index],
              );
            },
          );
        }
      },
    );
  }
}
