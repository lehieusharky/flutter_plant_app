import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class SearchBarHomePage extends StatefulWidget {
  final TextEditingController searchController;
  const SearchBarHomePage({
    super.key,
    required this.searchController,
  });

  @override
  State<SearchBarHomePage> createState() => _SearchBarHomePageState();
}

class _SearchBarHomePageState extends State<SearchBarHomePage> {
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
    );
  }

  Widget _buildSuffixIcon() {
    return InkWell(
      onTap: () {},
      child: Icon(
        Icons.send_rounded,
        size: context.sizeWidth(25),
        color: _iconColor,
      ),
    );
  }
}
