import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_divider.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_loading.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_seperator.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_snack_bar.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_button.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/add_photo_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_form.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:uuid/uuid.dart';

class CreateTimelineModal extends StatefulWidget {
  const CreateTimelineModal({super.key});

  @override
  State<CreateTimelineModal> createState() => _CreateTimelineModalState();
}

class _CreateTimelineModalState extends State<CreateTimelineModal> {
  final _descriptionController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  File? _imageTimeLineFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserPickImageFromCameraSuccess) {
            CustomSnakBar.showSnackbar(
              context: context,
              message: 'Take image from camera succcess',
              backgroundColor: colorTheme.get2DDA93,
            );
            _imageTimeLineFile = state.image;
          }
          if (state is UserPostTimeLineImageSuccess) {
            _createTimeLine(context: context, imageUrl: state.imageUrl);
          }
          if (state is UserFailure) {
            CustomSnakBar.showSnackbar(
              context: context,
              message: state.message,
              backgroundColor: colorTheme.getFF6262,
            );
          }

          if (state is UserCreateTimeLineSuccess) {
            CustomSnakBar.showSnackbar(
              context: context,
              message: translate(context).createTimelineSuccess,
              backgroundColor: colorTheme.get2DDA93,
            );
            context.pop(true);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: context.padding(horizontal: 12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextButton.cancel(context),
                            const CustomSeperator(),
                            CustomTextButton.save(
                                saveText: translate(context).save,
                                context: context,
                                onPressed: () =>
                                    _createTimeLineValidation(context: context))
                          ],
                        ),
                        const CustomDivider(),
                        context.sizedBox(height: 5),
                        Text(
                          translate(context).description,
                          style: theme(context).textTheme.titleMedium,
                        ),
                        context.sizedBox(height: 5),
                        CreateTimelineForm(
                          descriptionController: _descriptionController,
                          keyForm: _keyForm,
                          imageFile: _imageTimeLineFile,
                        ),
                        context.sizedBox(height: 20),
                        AddPhotosButton(onPressed: () => _pickPhoto(context)),
                        context.sizedBox(height: 10),
                        if (_imageTimeLineFile != null)
                          Image.file(_imageTimeLineFile!)
                      ],
                    ),
                    if (state is UserLoading) const CustomLoading()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _createTimeLineValidation({required BuildContext context}) {
    if (_keyForm.currentState?.validate() ?? false) {
      _postTimeLineImages(context);
    }
  }

  void _createTimeLine({
    required BuildContext context,
    required String imageUrl,
  }) {
    context.read<UserBloc>().add(
          UserCreateTimeLine(
            timeLineModel: TimeLineModel(
              description: _descriptionController.text.trim(),
              image: imageUrl,
              createAt: DateTime.now().toString(),
              userId: sharePreference.getUserId(),
              timeLineId: const Uuid().v4(),
            ),
          ),
        );
  }

  void _pickPhoto(BuildContext context) {
    context.read<UserBloc>().add(UserPickImageFromCamera());
  }

  void _postTimeLineImages(BuildContext context) {
    context
        .read<UserBloc>()
        .add(UserPostTimeLineImage(image: _imageTimeLineFile!));
  }
}
