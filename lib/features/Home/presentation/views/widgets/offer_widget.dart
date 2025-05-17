import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/presentation/views/widgets/custom_button.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 26.w, left: 24.w, right: 24.w),
      child: Container(
        width: 345.w,
        height: 150.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.offerColor, AppColors.whitePrimary]),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 22.w, left: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buy one get one free!',
                    style: GoogleFonts.lato(
                        color: AppColors.filterIcon,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'Enjoy our big offer of \nevery day',
                    style: GoogleFonts.lato(
                        color: AppColors.cursor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const offerCustomButton(),
                ],
              ),
            ),
            Positioned(
              top: 30,
              right: 0,
              child: Transform.rotate(
                angle: -0.2,
                child: Image.asset(
                  'assets/logos/offerphoto.png',
                  width: 144.w,
                  height: 119.41.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
