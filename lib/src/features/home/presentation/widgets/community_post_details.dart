import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/widgets/app_bar_community_post.dart';
import 'package:plant_market/src/features/home/presentation/widgets/body_community_post.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CommunityPostDetails extends StatefulWidget {
  final CommunityPostModel communityPostModel;
  final void Function() addFavoriteCommunityPost;

  const CommunityPostDetails({
    super.key,
    required this.communityPostModel,
    required this.addFavoriteCommunityPost,
  });

  @override
  State<CommunityPostDetails> createState() => _CommunityPostDetailsState();
}

class _CommunityPostDetailsState extends State<CommunityPostDetails> {
  final _pageScrollController = ScrollController();
  bool _showSaveButton = true;

  @override
  void initState() {
    super.initState();

    _pageScrollController.addListener(() {
      _handelShowSaveButton();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: context.width,
            height: context.height * 0.9,
            child: CustomScrollView(
              controller: _pageScrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                AppBarCommunityPost(
                  imageUrl: widget.communityPostModel.image,
                  title: widget.communityPostModel.title,
                  id: widget.communityPostModel.id,
                ),
                BodyCommunityPostDetail(
                  description: widget.communityPostModel.description,
                  tags: widget.communityPostModel.tags,
                ),
              ],
            ),
          ),
          _showSaveButton
              ? Padding(
                  padding: context.padding(all: 12),
                  child: CustomButton.send(
                    title: translate(context).save,
                    backgroundColor: colorTheme.get2DDA93,
                    context: context,
                    onPressed: widget.addFavoriteCommunityPost,
                  ),
                ).animate().slide(
                    duration: 300.ms,
                    curve: Curves.easeInOut,
                    begin: const Offset(0, 0.5),
                    end: const Offset(0, -0.2),
                  )
              : Padding(
                  padding: context.padding(all: 12),
                  child: CustomButton.send(
                      title: translate(context).save,
                      backgroundColor: colorTheme.get2DDA93,
                      context: context,
                      onPressed: () {}),
                ).animate().slide(
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                    begin: const Offset(0, -0.2),
                    end: const Offset(0, 2),
                  ),
        ],
      ),
    );
  }

  void _handelShowSaveButton() {
    if (_pageScrollController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        _showSaveButton != false) {
      setState(() {
        _showSaveButton = false;
      });
    } else if (_pageScrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        _showSaveButton != true) {
      setState(() {
        _showSaveButton = true;
      });
    }
  }

  @override
  void dispose() {
    _pageScrollController.dispose();
    super.dispose();
  }
}
