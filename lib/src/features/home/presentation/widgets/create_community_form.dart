import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';

class CreateCommunityPostForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final GlobalKey<FormState> keyForm;
  final File? imageFile;

  const CreateCommunityPostForm({
    super.key,
    required this.titleController,
    required this.bodyController,
    required this.keyForm,
    this.imageFile,
  });

  @override
  State<CreateCommunityPostForm> createState() =>
      _CreateCommunityPostFormState();
}

class _CreateCommunityPostFormState extends State<CreateCommunityPostForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.keyForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: widget.titleController,
            borderRadius: context.sizeWidth(5),
            autoValidateMode: AutovalidateMode.onUserInteraction,
            backgroundColor:
                theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
            keyboardType: TextInputType.text,
            hintText: translate(context).title,
            validator: (title) => title == null
                ? translate(context).canNotLeaveTheTitleBlank
                : null,
          ),
          context.sizedBox(height: 3),
          CustomTextFormField.modal(
            context: context,
            controller: widget.bodyController,
            maxLine: 10,
            validator: (bodyValue) => _bodyValidation(bodyValue: bodyValue),
            hintText: translate(context).contentOfTheArticle,
          ),
        ],
      ),
    );
  }

  String? _bodyValidation({String? bodyValue}) {
    if (bodyValue == '' || bodyValue == null) {
      return translate(context).describeSomethingAboutThisStageOfThePlant;
    } else if (widget.imageFile == null) {
      return translate(context).pleaseAddPhotosToYourPosts;
    } else {
      return null;
    }
  }
}
