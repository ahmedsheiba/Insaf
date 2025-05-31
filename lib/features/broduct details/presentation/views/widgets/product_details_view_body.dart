import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: GoogleFonts.rubik(
              color: AppColors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/logos/product.png',
            width: 345.w,
            height: 153.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Plant Based Tuna',
                style: GoogleFonts.lato(
                    color: AppColors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  RatingStars(
                    starCount: 1,
                    maxValue: 4,
                    value: 4,
                    valueLabelVisibility: false,
                    starColor: AppColors.starRate,
                    starSize: 18.r,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    '4.8',
                    style: GoogleFonts.lato(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '(124)',
                    style: GoogleFonts.lato(
                      color: AppColors.textRate,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            'EGP 64',
            style: GoogleFonts.lato(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
            ),
          ),
          Text(
            'A delicious andA delicious and A delicious and A delicious and',
            style: GoogleFonts.lato(
              color: AppColors.cursor,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
