import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/core/utils/app_border.dart';
import '../theme/app_colors.dart';
import '../theme/app_paddings.dart';
import '../theme/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
        this.textInputAction = TextInputAction.next,
        this.keyboardType = TextInputType.text,
        this.controller,
        this.hintText,
        this.labelText,
        this.helperText,
        this.obscureText = false,
        this.validator,
        this.onChanged,
        this.onSubmit,
        this.onTap,
        this.autofocus = false,
        this.readOnly = false,
        this.maxLine = 1,
        this.minLine = 1,
        this.fillColor = AppColors.white,
        this.textFieldHintColor = AppColors.secondary,
        this.textFieldLabelColor = AppColors.secondary,
        this.isPasswordField = false,
        this.filled = true,
        this.inputBorder,
        this.suffixIconData,
        this.labelStyle,
        this.hintStyle,
        this.style,
        this.prefix,
        this.errorBorder,
        this.suffixIcon,
        this.cursorColor,
        this.contentPadding,
        this.autoValidateMode,
        this.focusBorder
      });

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final IconData? suffixIconData;
  final Widget? suffixIcon;
  final Widget? prefix;

  final String? hintText;
  final String? labelText;
  final String? helperText;

  final bool autofocus;
  final bool readOnly;
  final bool filled;
  final bool obscureText;
  final bool isPasswordField;

  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final VoidCallback? onTap;

  final int? maxLine;
  final int? minLine;

  final Color? fillColor;
  final Color? textFieldHintColor;
  final Color? textFieldLabelColor;
  final Color? cursorColor;
  final InputBorder? inputBorder;
  final InputBorder? focusBorder;
  final InputBorder? errorBorder;
  final EdgeInsetsGeometry? contentPadding;

  final AutovalidateMode? autoValidateMode;


  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
      maxLines: widget.maxLine,
      minLines: widget.minLine,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onSubmit,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPasswordField ? _obscureText : false,
      controller: widget.controller,
      cursorColor: widget.cursorColor ?? AppColors.secondary,
      style: widget.style ?? AppTextStyles.getMediumStyle(),
      decoration: InputDecoration(
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: widget.contentPadding ?? AppPaddings.defaultContent,
        errorMaxLines: 3,
        labelText: widget.labelText,
        helperMaxLines: 2,
        helperText: widget.helperText,
        border: widget.inputBorder ?? AppBorder.fieldDefault(),
        enabledBorder: widget.inputBorder,
        focusedBorder: widget.focusBorder ?? AppBorder.focusedDefault(),
        errorBorder: widget.errorBorder,
        filled: widget.filled,
        fillColor: widget.fillColor,
        hintStyle: widget.hintStyle ??
            AppTextStyles.getRegularStyle(color: widget.textFieldHintColor),
        labelStyle:
        widget.labelStyle ??
            AppTextStyles.getRegularStyle(color: widget.textFieldLabelColor),
        prefixIcon: widget.prefix,
        suffixIcon: widget.isPasswordField
            ? IconButton(
          onPressed: _toggleObscureText,
          icon: Icon(
            _obscureText
                ? CupertinoIcons.eye_slash
                : Icons.remove_red_eye,
            color: !_obscureText ? AppColors.black : AppColors.primary,
          ),
        )
            : (widget.suffixIconData != null
            ? Icon(widget.suffixIconData)
            : widget.suffixIcon),
        hintText: widget.hintText,
      ),
    );
  }
}