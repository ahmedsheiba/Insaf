import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class SheetHeadText extends StatelessWidget {
  const SheetHeadText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: AppColors.verifyColor,
        fontWeight: FontWeight.w700,
        fontSize: 15.sp,
        letterSpacing: 0.5,
      ),
    );
  }
}
