import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/user/presentation/widgets/add_photo_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/cancel_button.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: context.padding(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  _buildSeperator(),
                  Padding(
                    padding: context.padding(top: 5),
                    child: const CancelButton(),
                  ),
                ],
              ),
              _buildDivider(),
              context.sizedBox(height: 5),
              Text(
                translate(context).description,
                style: theme(context).textTheme.titleMedium,
              ),
              context.sizedBox(height: 12),
              CreatePostForm(descriptionController: _descriptionController),
              context.sizedBox(height: 20),
              AddPhotosButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.8),
    );
  }

  Widget _buildSeperator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '________',
          style: theme(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
