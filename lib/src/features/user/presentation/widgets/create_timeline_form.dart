import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';

class CreateTimelineForm extends StatefulWidget {
  final TextEditingController descriptionController;
  final GlobalKey<FormState> keyForm;
  final File? imageFile;

  const CreateTimelineForm({
    super.key,
    required this.descriptionController,
    required this.keyForm,
    this.imageFile,
  });

  @override
  State<CreateTimelineForm> createState() => _CreateTimelineFormState();
}

class _CreateTimelineFormState extends State<CreateTimelineForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.keyForm,
      child: CustomTextFormField.modal(
        context: context,
        controller: widget.descriptionController,
        maxLine: 10,
        validator: (description) =>
            _timelineDescriptionValidation(timelineDescription: description),
      ),
    );
  }

  String? _timelineDescriptionValidation({String? timelineDescription}) {
    if (timelineDescription == '') {
      return translate(context).describeSomethingAboutThisStageOfThePlant;
    } else if (widget.imageFile == null) {
      return translate(context).pleaseTakeImageForThisStateOfThePlant;
    } else {
      return null;
    }
  }
}
/*
CustomTextFormField(
        borderRadius: 5,
        onTapOutSide: (value) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        controller: widget.descriptionController,
        maxLines: 10,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (timelineDescription) => _timelineDescriptionValidation(
            timelineDescription: timelineDescription),
        textStyle: theme(context).textTheme.titleMedium,
        keyboardType: TextInputType.text,
        hintText: translate(context).describeSomethingAboutThisStageOfThePlant,
        backgroundColor:
            theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
      ),

*/