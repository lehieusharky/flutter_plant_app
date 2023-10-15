import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/router/router_path.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      boxShadowColor: ThemeManager.shadowButton(),
      width: context.width,
      height: context.sizeHeight(52),
      onPress: () => context.go(RouterPath.searchPage),
      backgroundColor: ThemeManager.backgroundButton(),
      borderRadius: context.sizeWidth(5),
      child: Row(
        children: [
          _buildSearchIcon(context),
          context.sizedBox(width: 15),
          _buildHintText(context),
        ],
      ),
    );
  }

  Widget _buildSearchIcon(BuildContext context) {
    return Icon(
      Icons.search,
      size: context.sizeWidth(25),
      color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.5),
    );
  }

  Widget _buildHintText(BuildContext context) {
    return Text(
      translate(context).search,
      style: theme(context).textTheme.titleMedium!.copyWith(
            color:
                theme(context).textTheme.titleMedium!.color!.withOpacity(0.5),
          ),
    );
  }
}
