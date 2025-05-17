import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class SuggestedSection extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/logos/product.png',
      'name': 'Kaiser Bread',
      'price': 'EGP 50',
      'rating': 4.5,
      'reviews': 124,
    },
    {
      'image': 'assets/logos/product.png',
      'name': 'Kaiser Bread',
      'price': 'EGP 50',
      'rating': 4.5,
      'reviews': 124,
    },
    {
      'image': 'assets/logos/product.png',
      'name': 'Kaiser Bread',
      'price': 'EGP 50',
      'rating': 4.5,
      'reviews': 124,
    },
    {
      'image': 'assets/logos/product.png',
      'name': 'Kaiser Bread',
      'price': 'EGP 50',
      'rating': 4.5,
      'reviews': 124,
    },
  ];

  SuggestedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggested For You',
            style: GoogleFonts.rubik(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.cursor,
            ),
          ),
          SizedBox(height: 14.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 17.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.49.h,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.cursor,
                      blurRadius: 0.2,
                      offset: Offset.zero,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        product['image'],
                        height: 136.h,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      product['name'],
                      style: GoogleFonts.lato(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      product['price'],
                      style: GoogleFonts.rubik(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        RatingStars(
                          value: product['rating'],
                          valueLabelVisibility: false,
                          starColor: AppColors.starRate,
                          starSize: 14.r,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '(${product['reviews']})',
                          style: GoogleFonts.lato(
                            color: AppColors.textRate,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
