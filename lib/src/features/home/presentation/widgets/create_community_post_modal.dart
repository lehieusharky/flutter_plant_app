import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_divider.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_seperator.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/create_community_form.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_button.dart';

class CreateCommunityPostModal extends BaseWidget {
  const CreateCommunityPostModal({super.key});

  @override
  BaseWidgetState createState() => _CreateCommunityPostModalState();
}

class _CreateCommunityPostModalState extends BaseWidgetState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          super.isNotLoggedIn()
              ? const SizedBox()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextButton.cancel(context),
                        const CustomSeperator(),
                        CustomTextButton.save(
                          context: context,
                          onPressed: () {},
                          saveText: 'Post',
                        )
                      ],
                    ),
                    const CustomDivider(),
                    context.sizedBox(height: 5),
                  ],
                ),
          context.sizedBox(height: super.isNotLoggedIn() ? 20 : 1),
          const CreateCommunityPostForm(),
        ],
      ),
    );
  }
}
