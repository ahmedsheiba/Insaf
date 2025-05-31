import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DataSection extends StatelessWidget {
  const DataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            SizedBox(
              height: 45.h,
            ),
            Container(
              height: 219.h,
              width: 331.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cursor.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/logos/misrElkher.jpg',
                height: 90.h,
                width: 105.w,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 16.h,
                bottom: 8.h,
              ),
              child: Text(
                'Misr Elkheir',
                style: GoogleFonts.rubik(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.arrowLeft,
                ),
              ),
            ),
            Text(
              'Alex, 20 Ibrahim naseer',
              style: GoogleFonts.lato(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.checkBox,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              height: 64.h,
              width: 291.w,
              decoration: BoxDecoration(
                color: AppColors.completeContainerColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
              ),
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 24,
                    lineWidth: 4,
                    percent: 0.7,
                    center: Container(
                      alignment: Alignment.center,
                      width: 30.w,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Text(
                        '70%',
                        style: GoogleFonts.lato(
                          color: AppColors.primary,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    progressColor: AppColors.primary,
                    backgroundColor: Colors.transparent,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 7.w,
                    ),
                    child: Text(
                      'Complete your \n profile to stand out',
                      style: GoogleFonts.lato(
                        color: AppColors.arrowLeft,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        AppColors.primary,
                      ),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
