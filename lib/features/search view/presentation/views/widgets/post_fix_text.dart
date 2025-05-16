import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class PostFixText extends StatelessWidget {
  const PostFixText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: AppColors.verifyColor,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      ),
    );
  }
}
