import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;


  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          TextSpan(
            text:subTitle,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.cursor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
