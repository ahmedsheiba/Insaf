import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_solid.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CategoriesAlertWidget extends StatelessWidget {
  const CategoriesAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        width: 75.w,
        height: 26.h,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r),
            bottomLeft: Radius.circular(24.r),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 4,
                left: 8,
                top: 8,
                bottom: 8,
              ),
              child: Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                width: 15.r,
                height: 15.r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                ),
                child: const Iconify(
                  IconParkSolid.attention,
                  color: AppColors.alert,
                ),
              ),
            ),
            Text(
              '5 days left ',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 9.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
