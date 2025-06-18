import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class FAQButtons extends StatelessWidget {
  const FAQButtons({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(100.w, 36.h),
        backgroundColor: isActive ? AppColors.editPenColor : Colors.white,
        side: BorderSide(
          color: AppColors.editPenColor,
          width: 1.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.lato(
          fontSize: 14.sp,
          color: isActive ? Colors.white : AppColors.editPenColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}