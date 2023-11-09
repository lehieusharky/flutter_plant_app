import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_heart_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/community_post_details.dart';
import 'package:plant_market/src/theme/text_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class CommunityPostItem extends StatelessWidget {
  final CommunityPostModel communityPostModel;

  const CommunityPostItem({
    super.key,
    required this.communityPostModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showTopicModal(context: context),
      child: Padding(
        padding: context.padding(horizontal: 5),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _buildBackground(context),
                _buildMark(context),
                Padding(
                  padding: context.padding(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTitle(context),
                      context.sizedBox(height: 10),
                      _buildDescription(context),
                      context.sizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
            _buildLeafPlusButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLeafPlusButton(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: context.padding(all: 10),
        child: Container(
          alignment: Alignment.center,
          width: context.sizeWidth(70),
          height: context.sizeHeight(30),
          decoration: BoxDecoration(
            color: ThemeManager.backgroundButton().withOpacity(0.7),
            borderRadius: BorderRadius.circular(context.sizeWidth(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '20',
                style: AppTextTheme.darkTheme(context).titleSmall,
              ),
              CustomHeartButton(
                size: context.sizeWidth(20),
                isLiked: _isLiked(),
                onPressed: (status) async {
                  if (status) {
                    _removeFavoriteCommunityPost(context);
                  } else {
                    _addFavoriteCommunityPost(context);
                  }
                  return !status;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMark(BuildContext context) {
    return Container(
      width: context.sizeWidth(270),
      height: context.sizeHeight(350 / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.sizeWidth(24)),
        gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xcc000000),
              Color(0x000d0d0d),
            ]),
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.sizeWidth(270),
      height: context.sizeHeight(350),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.sizeWidth(24)),
          boxShadow: [
            BoxShadow(
              color: ThemeManager.shadowTopicButton(),
              spreadRadius: 3,
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ]),
      child: CustomCatchedNetWorkImage(
        width: context.sizeWidth(270),
        height: context.sizeHeight(360),
        borderRadius: context.sizeWidth(24),
        imageUrl: communityPostModel.image,
      ),
    );
  }

  bool _isLiked() {
    try {
      return userInfo!.listFavoriteIDCommunityPost
          .contains(communityPostModel.id);
    } catch (e) {
      return false;
    }
  }

  void _addFavoriteCommunityPost(BuildContext context) {
    context.read<HomePageBloc>().add(HomePageAddFavoriteCommunityPost(
        communityPostId: communityPostModel.id));
  }

  void _removeFavoriteCommunityPost(BuildContext context) {
    context.read<HomePageBloc>().add(HomePageRemoveFavoriteCommunityPost(
        communityPostId: communityPostModel.id));
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      communityPostModel.title,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: AppTextTheme.darkTheme(context)
          .titleLarge!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      communityPostModel.description,
      maxLines: 3,
      textAlign: TextAlign.center,
      style:
          AppTextTheme.darkTheme(context).titleMedium!.copyWith(fontSize: 12),
      overflow: TextOverflow.ellipsis,
    );
  }

  void _showTopicModal({required BuildContext context}) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.9,
      child: CommunityPostDetails(
        communityPostModel: communityPostModel,
        addFavoriteCommunityPost: () => _addFavoriteCommunityPost(context),
      ),
    );
  }
}
