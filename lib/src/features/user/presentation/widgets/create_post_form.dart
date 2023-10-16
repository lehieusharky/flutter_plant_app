import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';

class CreatePostForm extends StatefulWidget {
  final TextEditingController descriptionController;
  const CreatePostForm({super.key, required this.descriptionController});

  @override
  State<CreatePostForm> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      borderRadius: 5,
      controller: widget.descriptionController,
      maxLines: 10,
      textStyle: theme(context).textTheme.titleMedium,
      keyboardType: TextInputType.text,
      hintText: translate(context).describeSomethingAboutThisStageOfThePlant,
      backgroundColor:
          theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
    );
  }
}
