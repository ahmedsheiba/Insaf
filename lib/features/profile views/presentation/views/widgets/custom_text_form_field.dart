import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: const Icon(
          Icons.visibility,
          color: AppColors.editPenColor,
        ),
        hintStyle: GoogleFonts.lato(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
          color: const Color(0xffcccccc),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xffcccccc),
          ),
        ),
      ),
    );
  }
}
