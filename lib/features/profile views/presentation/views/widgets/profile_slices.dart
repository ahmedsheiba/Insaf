import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileSlices extends StatelessWidget {
  const ProfileSlices({super.key, required this.icon, required this.title});

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
      ),
      width: 345.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.cursor.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(
                right: 16.w,
              ),
              child: icon),
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.arrowLeft,
            ),
          ),
          const Spacer(),
          Icon(
            LucideIcons.chevronRight,
            color: AppColors.verifyColor,
            size: 28.sp,
          )
        ],
      ),
    );
  }
}
