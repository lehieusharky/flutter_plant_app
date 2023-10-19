import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_button.dart';
import 'package:plant_market/src/features/user/data/models/time_line_model.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/add_photo_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_post_form.dart';
import 'package:uuid/uuid.dart';

class CreatePostModal extends StatefulWidget {
  const CreatePostModal({super.key});

  @override
  State<CreatePostModal> createState() => _CreatePostModalState();
}

class _CreatePostModalState extends State<CreatePostModal> {
  final _descriptionController = TextEditingController();
  String _imageTimeLine = '';
  late File _imageTimeLineFile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserPickImageFromCameraSuccess) {
            _imageTimeLineFile = state.image;
          }
          if (state is UserPostTimeLineImageSuccess) {
            _createTimeLine(context: context, imageUrl: state.imageUrl);
          }

          if (state is UserCreateTimeLineSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: context.padding(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextButton.cancel(context),
                        _buildSeperator(),
                        CustomTextButton.save(
                            context: context,
                            onPressed: () {
                              context.read<UserBloc>().add(
                                  UserPostTimeLineImage(
                                      image: _imageTimeLineFile));
                            })
                      ],
                    ),
                    _buildDivider(),
                    context.sizedBox(height: 5),
                    Text(
                      translate(context).description,
                      style: theme(context).textTheme.titleMedium,
                    ),
                    context.sizedBox(height: 12),
                    CreatePostForm(
                        descriptionController: _descriptionController),
                    context.sizedBox(height: 20),
                    AddPhotosButton(onPressed: () => _pickPhoto(context)),
                    if (state is UserPickImageFromCameraSuccess)
                      Image.file(state.image)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _createTimeLine({
    required BuildContext context,
    required String imageUrl,
  }) {
    final userId = firebaseAuth.currentUser!.uid;
    context.read<UserBloc>().add(
          UserCreateTimeLine(
            timeLineModel: TimeLineModel(
              description: _descriptionController.text.trim(),
              image: imageUrl,
              createAt: DateTime.now().toString(),
              userId: userId,
              timeLineId: const Uuid().v4(),
            ),
          ),
        );
  }

  void _pickPhoto(BuildContext context) {
    context.read<UserBloc>().add(UserPickImageFromCamera());
  }

  Widget _buildDivider() {
    return Divider(
      color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.8),
    );
  }

  Widget _buildSeperator() {
    return Text(
      '________',
      style: theme(context).textTheme.titleMedium,
    );
  }
}
