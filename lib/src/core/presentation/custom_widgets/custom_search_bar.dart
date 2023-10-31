import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/router/router_path.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final String hintText;
  final bool? autoFocus;

  const CustomSearchBar({
    super.key,
    required this.searchController,
    required this.hintText,
    this.autoFocus,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Color _iconColor = colorTheme.getD2D2D2;

  void _setIconFocus() {
    setState(() {
      _showSendButton = true;
      _iconColor = colorTheme.get2DDA93;
    });
  }

  void _setIconUnFocus() {
    setState(() {
      _showSendButton = false;
      _iconColor = colorTheme.getD2D2D2;
    });
  }

  bool _showSendButton = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField.search(
      autoFocus: widget.autoFocus ?? true,
      suffixIcon: _showSendButton ? _buildSuffixIcon() : const SizedBox(),
      prefixIcon: Icon(
        Icons.search,
        size: context.sizeWidth(25),
        color: _iconColor,
      ),
      onSubmit: (value) {},
      onTap: () => _setIconFocus(),
      onTapOutSide: (value) {
        _setIconUnFocus();
        FocusManager.instance.primaryFocus!.unfocus();
      },
      searchController: widget.searchController,
      context: context,
      hintText: widget.hintText,
    );
  }

  Widget _buildSuffixIcon() {
    return InkWell(
      onTap: () => context.go(RouterPath.searchPage),
      child: Icon(
        Icons.send_rounded,
        size: context.sizeWidth(25),
        color: _iconColor,
      ),
    );
  }
}
