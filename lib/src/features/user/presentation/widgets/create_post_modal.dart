import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '________',
                        style: theme(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Padding(
                    padding: context.padding(top: 10),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: theme(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: theme(context)
                    .textTheme
                    .titleMedium!
                    .color!
                    .withOpacity(0.8),
              ),
              context.sizedBox(height: 5),
              Text(
                'Description',
                style: theme(context).textTheme.titleMedium,
              ),
              context.sizedBox(height: 12),
              CustomTextFormField(
                borderRadius: 5,
                controller: _descriptionController,
                maxLines: 10,
                keyboardType: TextInputType.text,
                hintText: 'Write something about your plant',
                backgroundColor: colorTheme.get6A6F7D.withOpacity(0.3),
              ),
              context.sizedBox(height: 20),
              CustomButton(
                  width: context.sizeWidth(125),
                  height: context.sizeHeight(112),
                  onPress: () {},
                  backgroundColor: ThemeManager.backgroundButton(),
                  borderRadius: 5,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.plus_one),
                      Text('Add photos'),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
