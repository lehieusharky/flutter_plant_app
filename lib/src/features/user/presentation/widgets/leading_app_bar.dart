import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';

class LeadingAppBar extends StatelessWidget {
  final Color? color;

  const LeadingAppBar({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: Center(
        child: CustomButton(
          onPress: () => _createPlant(context),
          backgroundColor: Colors.transparent,
          borderRadius: context.sizeWidth(20),
          child: CustomSvg(
            path: imageConstant.leafPlusSvg,
            color: color ?? theme(context).textTheme.titleMedium!.color!,
            width: context.sizeWidth(25),
            height: context.sizeHeight(25),
          ),
        ),
      ),
    );
  }

  void _createPlant(BuildContext context) {
    context.read<UserBloc>().add(const UserCreatePlant(plantName: "Tree_test"));
  }
}
