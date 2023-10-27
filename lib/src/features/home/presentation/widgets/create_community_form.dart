import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';

class CreateCommunityPostForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController bodyController;

  const CreateCommunityPostForm({
    super.key,
    required this.titleController,
    required this.bodyController,
  });

  @override
  State<CreateCommunityPostForm> createState() =>
      _CreateCommunityPostFormState();
}

class _CreateCommunityPostFormState extends State<CreateCommunityPostForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: widget.titleController,
            borderRadius: context.sizeWidth(5),
            backgroundColor:
                theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
            keyboardType: TextInputType.text,
            hintText: 'Tieu de',
          ),
          context.sizedBox(height: 3),
          CustomTextFormField.modal(
            context: context,
            controller: widget.bodyController,
            maxLine: 10,
            validator: (bodyValue) => _bodyValidation(bodyValue: bodyValue),
            hintText: 'Noi dung cua bai viet',
          ),
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
