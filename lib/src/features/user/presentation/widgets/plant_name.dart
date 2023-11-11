import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_dialog.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_snack_bar.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/leaf_plus_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class PlantName extends StatefulWidget {
  final String plantName;
  final Color? colorLeadingAppBar;
  const PlantName({
    super.key,
    required this.plantName,
    this.colorLeadingAppBar,
  });

  @override
  State<PlantName> createState() => _PlantNameState();
}

class _PlantNameState extends State<PlantName> {
  final _selectPlantScroll = FixedExtentScrollController();
  String _selectPlantName = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserToggleSelectPlantSuccess) {
          CustomSnakBar.showSnackbar(
            context: context,
            message: 'Toggle select plant success',
            backgroundColor: colorTheme.get2DDA93,
          );
          context.pop(true);
        }
      },
      child: InkWell(
        onTap: () => _selectPlantDialog(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.plantName,
              style: theme(context).textTheme.titleLarge!.copyWith(
                    fontSize: context.sizeWidth(20),
                    color: colorTheme.get2DDA93,
                  ),
            ),
            context.sizedBox(width: 10),
            LeafPlusButton(color: widget.colorLeadingAppBar),
          ],
        ),
      ),
    );
  }

  void _selectPlantDialog(BuildContext context) {
    CustomDialog.baseDialog(
      context: context,
      title: translate(context).selectYourPlant,
      confirmText: translate(context).accept,
      cancelText: translate(context).cancel,
      onConfirm: () =>
          _toogleSelectPlant(context: context, plantName: _selectPlantName),
      content: SizedBox(
        height: context.sizeHeight(200),
        child: ListWheelScrollView(
          itemExtent: context.sizeHeight(60),
          controller: _selectPlantScroll,
          scrollBehavior: const ScrollBehavior(),
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: 2,
          clipBehavior: Clip.antiAlias,
          useMagnifier: true,
          onSelectedItemChanged: (selectedItem) {
            _selectPlantName = userInfo!.listPlantName[selectedItem];
          },
          children: userInfo!.listPlantName
              .map((String text) => Text(
                    text,
                    style: theme(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  void _toogleSelectPlant({
    required BuildContext context,
    required String plantName,
  }) {
    context.read<UserBloc>().add(UserToggleSelectPlant(plantName: plantName));
  }
}
