import 'package:flutter/material.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final Color backGroundColor = colorTheme.get2DDA93;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextInputType keyboardType;
  final AutovalidateMode? autoValidateMode;
  final void Function(String)? onChanged;
  final String hintText;
  final double? borderRadius;
  final TextStyle? textStyle;

  CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.textStyle,
    this.maxLines,
    required this.keyboardType,
    this.autoValidateMode,
    required this.hintText,
    this.onChanged,
    this.focusNode,
    this.autoFocus,
    this.textInputAction,
  });

  factory CustomTextFormField.email({
    required TextEditingController controller,
    required String hintText,
    required TextInputType keyboardType,
    TextInputAction? textInputAction,
    bool? autoFocus,
    required AutovalidateMode autoValidateMode,
    String? Function(String?)? validator,
  }) {
    return CustomTextFormField(
      maxLines: 1,
      controller: controller,
      hintText: hintText,
      autoFocus: autoFocus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autoValidateMode: autoValidateMode,
      validator: validator,
      suffixIcon: null,
      prefixIcon: const Icon(Icons.email),
    );
  }

  factory CustomTextFormField.password({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    required TextInputType keyboardType,
    TextInputAction? textInputAction,
    required AutovalidateMode autoValidateMode,
    String? Function(String?)? validator,
  }) {
    return CustomTextFormField(
      maxLines: 1,
      controller: controller,
      hintText: hintText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autoValidateMode: autoValidateMode,
      validator: validator,
      prefixIcon: const Icon(Icons.password),
    );
  }

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscuteText = false;
  Icon? prefixIcon;

  @override
  initState() {
    super.initState();
    prefixIcon = widget.prefixIcon;
  }

  _onPressed() {
    setState(() {
      _obscuteText = !_obscuteText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomBorder(
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        focusNode: widget.focusNode,
        obscureText: _obscuteText,
        autofocus: widget.autoFocus ?? false,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        style: AppTextTheme.getDefaultTextTheme(context).bodyMedium,
        autovalidateMode: widget.autoValidateMode,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          errorStyle: AppTextTheme.getDefaultTextTheme(context).bodyMedium,
          suffixIcon: (prefixIcon == const Icon(Icons.password))
              ? IconButton(
                  onPressed: () => _onPressed(),
                  icon: Icon(
                    _obscuteText ? Icons.visibility : Icons.visibility_off,
                  ))
              : widget.suffixIcon,
          fillColor: colorTheme.getFBFDFF,
          filled: true,
          hintText: widget.hintText,
          hintStyle: AppTextTheme.getDefaultTextTheme(context).labelSmall,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 0)),
          ),
        ),
      ),
    );
  }
}
