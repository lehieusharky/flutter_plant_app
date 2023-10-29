import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_loading.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/item_post.dart';

class ListPostHomePage extends StatefulWidget {
  const ListPostHomePage({super.key});

  @override
  State<ListPostHomePage> createState() => _PosstHomePageState();
}

class _PosstHomePageState extends State<ListPostHomePage> {
  List<CommunityPostModel> _listCommunityPost = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state is HomePageGetCommunityPostListSuccess) {
          _listCommunityPost = state.listCommunityPost;
        }
      },
      builder: (context, state) {
        if (_listCommunityPost.isEmpty) {
          return const Center(
            child: CustomLoading(),
          );
        } else {
          return Padding(
            padding: context.padding(horizontal: 12),
            child: SizedBox(
              height: context.sizeHeight(330),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: _listCommunityPost.length,
                itemBuilder: (context, index) {
                  return ItemPost(
                    communityPostModel: _listCommunityPost[index],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
