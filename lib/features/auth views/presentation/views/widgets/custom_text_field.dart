import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.icon,
      this.hintText,
      this.labelText,
      required this.isPassword,
      this.controller,
      this.keyboardType,
      this.validator,
      this.maxLength,
      this.buildCounter});

  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? labelText;
  final IconButton? icon;
  final bool isPassword;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLength;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      buildCounter: widget.buildCounter,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle visibility
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primary,
                ),
              )
            : widget.icon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.lato(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.grey,
        ),
        labelStyle: GoogleFonts.lato(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
      ),
    );
  }
}
