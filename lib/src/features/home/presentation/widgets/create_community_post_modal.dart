import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_divider.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_loading.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_seperator.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_snack_bar.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/core/utils/date_time_util.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/not_logged_in_button.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/create_community_form.dart';
import 'package:plant_market/src/features/user/presentation/widgets/add_photo_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:uuid/uuid.dart';

class CreateCommunityPostModal extends BaseWidget {
  final int lengthOfCommunityList;
  final void Function(CommunityPostModel communityPostModel)
      updateListCommunityPostModel;

  final void Function() updateLengthOfCommunityPost;

  const CreateCommunityPostModal({
    super.key,
    super.child,
    required this.updateLengthOfCommunityPost,
    required this.lengthOfCommunityList,
    required this.updateListCommunityPostModel,
  });

  @override
  BaseWidgetState createState() => _CreateCommunityPostModalState();
}

class _CreateCommunityPostModalState extends BaseWidgetState {
  final _bodyController = TextEditingController();
  final _titleController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  File? _imageFile;
  final List<String> _listTag = [];
  String _bodyContent = "";

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
              (widget as CreateCommunityPostModal)
                  .updateListCommunityPostModel(state.communityPostModel);
              CustomSnakBar.showSnackbar(
                context: context,
                message: translate(context).createCommunityPostSuccess,
                backgroundColor: colorTheme.get2DDA93,
              );
              context.pop(true);
            }
          },
          builder: (context, state) {
            if (super.isNotLoggedIn()) {
              return const NotLoggedInButton();
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: context.padding(horizontal: 12),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomTextButton.cancel(context),
                                  const CustomSeperator(),
                                  _imageFile != null
                                      ? CustomTextButton.save(
                                          context: context,
                                          onPressed: () => _post(
                                              context: context,
                                              imageFile: _imageFile!),
                                          saveText: translate(context).post,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                              const CustomDivider(),
                              context.sizedBox(height: 5),
                            ],
                          ),
                          context.sizedBox(
                              height: super.isNotLoggedIn() ? 20 : 1),
                          CreateCommunityPostForm(
                            titleController: _titleController,
                            bodyController: _bodyController,
                            imageFile: _imageFile,
                            keyForm: _keyForm,
                          ),
                          context.sizedBox(height: 20),
                          AddPhotosButton(
                              onPressed: () => _pickImageFromCamera(context)),
                          context.sizedBox(height: 10),
                          if (_imageFile != null) Image.file(_imageFile!),
                        ],
                      ),
                      if (state is HomePageLoading) const CustomLoading()
                    ],
                  ),
                ),
              );
            }
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

  void _post({required BuildContext context, required File imageFile}) {
    if (_keyForm.currentState?.validate() ?? false) {
      _postPostImage(context: context, imageFile: imageFile);
    }
  }

  void _formatDescriptionField() {
    final contentOfBodyField = _bodyController.text.trim().split(' ');
    for (String word in contentOfBodyField) {
      if (word.startsWith('#')) {
        _listTag.add(word);
      } else {
        _bodyContent += "$word ";
      }
    }
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
    _formatDescriptionField();
    context.read<HomePageBloc>().add(
          HomePageCreateCommunityPost(
            communityPostModel: CommunityPostModel(
              title: _titleController.text.trim(),
              description: _bodyContent,
              tags: _listTag,
              image: imageUrl,
              authorId: sharePreference.getUserId(),
              id: "${(widget as CreateCommunityPostModal).lengthOfCommunityList + 1}_${const Uuid().v4()}",
              clap: 0,
              authorName: userInfo!.userName!,
              createAt: DateTimeUtil.yearMonthDayNow(),
            ),
            number:
                (widget as CreateCommunityPostModal).lengthOfCommunityList + 1,
          ),
        );
  }
}
