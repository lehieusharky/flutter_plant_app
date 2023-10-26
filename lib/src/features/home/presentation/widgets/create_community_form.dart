import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/features/user/presentation/widgets/add_photo_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_button.dart';

class CreateCommunityPostForm extends StatefulWidget {
  const CreateCommunityPostForm({super.key});

  @override
  State<CreateCommunityPostForm> createState() =>
      _CreateCommunityPostFormState();
}

class _CreateCommunityPostFormState extends State<CreateCommunityPostForm> {
  final _bodyController = TextEditingController();
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: _titleController,
            backgroundColor:
                theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
            keyboardType: TextInputType.text,
            hintText: 'Title',
          ),
          context.sizedBox(height: 5),
          CustomTextFormField.modal(
            context: context,
            controller: _bodyController,
            maxLine: 10,
            validator: (bodyValue) => _bodyValidation(bodyValue: bodyValue),
          ),
          AddPhotosButton(onPressed: () {}),
        ],
      ),
    );
  }

  String? _bodyValidation({String? bodyValue}) {
    if (bodyValue == '') {
      return translate(context).describeSomethingAboutThisStageOfThePlant;
    } else {
      return null;
    }
  }
}
