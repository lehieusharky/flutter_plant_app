import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_divider.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_seperator.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_snack_bar.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/create_community_form.dart';
import 'package:plant_market/src/features/user/presentation/widgets/add_photo_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:uuid/uuid.dart';

class CreateCommunityPostModal extends BaseWidget {
  const CreateCommunityPostModal({super.key});

  @override
  BaseWidgetState createState() => _CreateCommunityPostModalState();
}

class _CreateCommunityPostModalState extends BaseWidgetState {
  final _bodyController = TextEditingController();
  final _titleController = TextEditingController();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomePageBloc(),
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePagePickImageFromCameraSuccess) {
              _imageFile = state.imageFile;
            }
            if (state is HomePagePostCommunityPostImageSuccess) {
              _createCommunityPost(context: context, imageUrl: state.imageUrl);
            }

            if (state is HomePageCreateCommunityPostSuccess) {
              CustomSnakBar.showSnackbar(
                context: context,
                message: 'Create community post success',
                backgroundColor: colorTheme.get2DDA93,
              );
              context.pop(true);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: context.padding(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextButton.cancel(context),
                            const CustomSeperator(),
                            _imageFile != null
                                ? CustomTextButton.save(
                                    context: context,
                                    onPressed: () => _postPostImage(
                                        context: context,
                                        imageFile: _imageFile!),
                                    saveText: 'Post',
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const CustomDivider(),
                        context.sizedBox(height: 5),
                      ],
                    ),
                    context.sizedBox(height: super.isNotLoggedIn() ? 20 : 1),
                    CreateCommunityPostForm(
                      titleController: _titleController,
                      bodyController: _bodyController,
                    ),
                    context.sizedBox(height: 20),
                    AddPhotosButton(
                        onPressed: () => _pickImageFromCamera(context)),
                    if (_imageFile != null)
                      Image.file(
                        _imageFile!,
                        width: context.width,
                        fit: BoxFit.cover,
                        height: context.sizeHeight(200),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void _postPostImage(
      {required BuildContext context, required File imageFile}) {
    context
        .read<HomePageBloc>()
        .add(HomePagePostCommunityPostImage(imageFile: imageFile));
  }

  void _pickImageFromCamera(BuildContext context) {
    context.read<HomePageBloc>().add(HomePagePickImageFromCamera());
  }

  void _createCommunityPost({
    required String imageUrl,
    required BuildContext context,
  }) {
    context.read<HomePageBloc>().add(HomePageCreateCommunityPost(
            communityPostModel: CommunityPostModel(
          title: _titleController.text.trim(),
          description: _bodyController.text.trim(),
          tags: const [],
          image: imageUrl,
          authorId: sharePreference.getUserId(),
          id: const Uuid().v4(),
        )));
  }
}
