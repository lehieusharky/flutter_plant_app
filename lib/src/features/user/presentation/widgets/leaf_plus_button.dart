import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_dialog.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';

class LeafPlusButton extends StatefulWidget {
  final Color? color;

  const LeafPlusButton({
    super.key,
    this.color,
  });

  @override
  State<LeafPlusButton> createState() => _LeafPlusButtonState();
}

class _LeafPlusButtonState extends State<LeafPlusButton> {
  final _plantNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: Center(
        child: CustomButton(
          onPress: () => _showPlantNameInputDialog(context),
          backgroundColor: Colors.transparent,
          borderRadius: context.sizeWidth(20),
          child: CustomSvg(
            path: imageConstant.leafPlusSvg,
            color: widget.color ?? theme(context).textTheme.titleMedium!.color!,
            width: context.sizeWidth(25),
            height: context.sizeHeight(25),
          ),
        ),
      ),
    );
  }

  void _showPlantNameInputDialog(BuildContext context) {
    CustomDialog.baseDialog(
      context: context,
      title: 'Enter plant name',
      content: SizedBox(
        width: context.width,
        child: CustomTextFormField(
          borderRadius: context.sizeWidth(5),
          onTapOutSide: (value) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          controller: _plantNameController,
          maxLines: 1,
          textStyle: theme(context).textTheme.titleMedium,
          keyboardType: TextInputType.text,
          hintText: 'Your plant name',
          backgroundColor:
              theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
        ),
      ),
      confirmText: 'Create',
      cancelText: 'Cancel',
      onConfirm: () => _createPlant(context),
    );
  }

  void _createPlant(BuildContext context) {
    final isPlantExist =
        userInfo!.listPlantName.contains(_plantNameController.text.trim());

    if (!isPlantExist) {
      context
          .read<UserBloc>()
          .add(UserCreatePlant(plantName: _plantNameController.text.trim()));
    } else {
      Logger().e('Plant name is already exist');
    }
  }
}
