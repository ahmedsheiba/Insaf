import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class offerCustomButton extends StatelessWidget {
  const offerCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 90.w,
        height: 29.h,
        decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(8.w)),
        child: Center(
          child: Text(
            'Order Now',
            style: GoogleFonts.lato(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
