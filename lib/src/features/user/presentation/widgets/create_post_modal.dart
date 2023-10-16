import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_button.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/add_photo_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_post_form.dart';

class CreatePostModal extends StatefulWidget {
  const CreatePostModal({super.key});

  @override
  State<CreatePostModal> createState() => _CreatePostModalState();
}

class _CreatePostModalState extends State<CreatePostModal> {
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocBuilder<UserBloc, UserState>(
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
                        CustomTextButton.save(context: context)
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
                      Image.file(state.image!)
                  ],
                ),
              ),
            ),
          );
        },
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
