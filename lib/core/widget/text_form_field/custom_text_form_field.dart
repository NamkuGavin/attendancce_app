import 'package:attendance_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/color_value.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final bool isPassword;

  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.validator,
      this.onChanged,
      this.isPassword = false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordNotVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword ? _isPasswordNotVisible : false,
      autocorrect: !widget.isPassword,
      enableSuggestions: !widget.isPassword,
      onChanged: widget.onChanged,
      style: TextThemeData.getTextTheme(Colors.black, 16.sp, FontWeight.w600),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: ColorValue.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: ColorValue.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2,
            color: ColorValue.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        hintText: widget.label,
        hintStyle: TextThemeData.getTextTheme(
            const Color(0xFFBDBDBD), 16.sp, FontWeight.w500),
        suffixIcon: widget.isPassword
            ? IconButton(
                splashRadius: 30,
                onPressed: () {
                  setState(() {
                    _isPasswordNotVisible = !_isPasswordNotVisible;
                  });
                },
                icon: _isPasswordNotVisible
                    ? const Icon(
                        Icons.visibility_off,
                        color: ColorValue.greyColor,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: ColorValue.greyColor,
                      ),
              )
            : null,
      ),
    );
  }
}
