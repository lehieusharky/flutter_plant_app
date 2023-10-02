import 'package:flutter/material.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
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
  final Color? boxShadowColor;
  final TextStyle? textStyle;
  final double? height;
  final Color backgroundColor;
  final Color? focusBorderColo;
  final Color? defaultBorderColor;
  final void Function()? onTap;
  final void Function()? onEditComplete;
  final void Function(String)? onSubmit;
  final void Function(PointerDownEvent)? onTapOutSide;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.textStyle,
    this.maxLines,
    this.height,
    required this.keyboardType,
    this.autoValidateMode,
    required this.hintText,
    this.onChanged,
    this.focusNode,
    this.autoFocus,
    this.textInputAction,
    this.boxShadowColor,
    required this.backgroundColor,
    this.focusBorderColo,
    this.defaultBorderColor,
    this.onTap,
    this.onEditComplete,
    this.onSubmit,
    this.onTapOutSide,
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
      backgroundColor: Colors.transparent,
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
      backgroundColor: Colors.transparent,
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
    return CustomShadow.textFormField(
      height: widget.height,
      boxShadowColor: widget.boxShadowColor ?? Colors.transparent,
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        focusNode: widget.focusNode,
        obscureText: _obscuteText,
        onTapOutside: widget.onTapOutSide,
        autofocus: widget.autoFocus ?? false,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onSubmit,
        validator: widget.validator,
        onEditingComplete: widget.onEditComplete,
        textInputAction: widget.textInputAction,
        style: AppTextTheme.getDefaultTextTheme(context).bodyMedium,
        autovalidateMode: widget.autoValidateMode,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: widget.defaultBorderColor ?? Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: widget.focusBorderColo ?? Colors.transparent),
          ),
          prefixIcon: widget.prefixIcon,
          errorStyle: AppTextTheme.getDefaultTextTheme(context).bodyMedium,
          suffixIcon: (prefixIcon == const Icon(Icons.password))
              ? IconButton(
                  onPressed: () => _onPressed(),
                  icon: Icon(
                    _obscuteText ? Icons.visibility : Icons.visibility_off,
                  ))
              : widget.suffixIcon,
          fillColor: widget.backgroundColor,
          filled: true,
          hintText: widget.hintText,
          hintStyle: AppTextTheme.getDefaultTextTheme(context).displayMedium,
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
