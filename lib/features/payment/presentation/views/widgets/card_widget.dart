import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

Widget CardWidget() {
  return Container(
    width: 345.w,
    height: 257.h,
    decoration: BoxDecoration(
      color: AppColors.verifyGrey,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Padding(
      padding: EdgeInsets.only(top: 30.w),
      child: Column(
        children: [
          Container(
            width: 200.w,
            height: 130.h,
            decoration: BoxDecoration(
              color: AppColors.arrowLeft,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Text(
                    "Debit",
                    style: GoogleFonts.lato(
                      color: AppColors.white,
                      fontSize: 10.sp,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  top: 60.h,
                  left: 10.w,
                  child: Text(
                    "---- ---- ---- ----",
                    style: GoogleFonts.lato(
                      color: AppColors.white,
                      fontSize: 13.sp,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  top: 90.h,
                  left: 10.w,
                  child: Text(
                    "************",
                    style: GoogleFonts.lato(
                      color: AppColors.white,
                      fontSize: 13.sp,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  top: 60.h,
                  right: 30.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "VALID\nTHRU",
                        style: GoogleFonts.lato(
                          color: AppColors.white,
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        "-/-",
                        style: GoogleFonts.lato(
                          color: AppColors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  right: 12.w,
                  child: Image.asset(
                    'assets/logos/master.png',
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            'No master card added',
            style: GoogleFonts.lato(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            'You can add a mastercard and save it for later',
            style: GoogleFonts.lato(
              color: AppColors.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
