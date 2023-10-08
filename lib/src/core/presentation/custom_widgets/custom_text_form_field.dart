import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/text_theme.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
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

  factory CustomTextFormField.search({
    required TextEditingController searchController,
    required BuildContext context,
  }) {
    return CustomTextFormField(
      height: context.sizeHeight(80),
      borderRadius: 100,
      prefixIcon: Icon(
        Icons.search,
        size: context.sizeWidth(25),
        color: colorTheme.getD2D2D2,
      ),
      boxShadowColor: colorTheme.get6A6F7D.withOpacity(0.2),
      controller: searchController,
      keyboardType: TextInputType.text,
      hintText: translate(context).search,
      backgroundColor: colorTheme.getFFFFFF,
    );
  }

  factory CustomTextFormField.phone({
    required TextEditingController controller,
    required AutovalidateMode autoValidateMode,
    String? Function(String?)? validator,
    required void Function() onTap,
    void Function(String)? onSubmit,
    required BuildContext context,
    void Function(PointerDownEvent)? onTapOutSide,
  }) {
    return CustomTextFormField(
      autoFocus: true,
      prefixIcon: Icon(
        FontAwesomeIcons.phone,
        color: colorTheme.get2DDA93,
      ),
      onTap: onTap,
      defaultBorderColor: colorTheme.getD2D2D2,
      focusBorderColo: colorTheme.get2DDA93,
      controller: controller,
      onSubmit: onSubmit,
      keyboardType: TextInputType.number,
      hintText: translate(context).enterYourPhoneNumber,
      backgroundColor: Colors.transparent,
      onTapOutSide: onTapOutSide,
    );
  }

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscuteText = false;

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
        style: theme(context).textTheme.titleLarge,
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
          errorStyle: AppTextTheme.lightTheme(context).bodyMedium,
          suffixIcon: (widget.prefixIcon == const Icon(Icons.password))
              ? IconButton(
                  onPressed: () => _onPressed(),
                  icon: Icon(
                    _obscuteText ? Icons.visibility : Icons.visibility_off,
                  ))
              : widget.suffixIcon,
          fillColor: widget.backgroundColor,
          filled: true,
          hintText: widget.hintText,
          hintStyle: theme(context).textTheme.titleMedium,
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
