import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/presentation/views/widgets/categories_alert_widget.dart';

class CategoriesProductItem extends StatelessWidget {
  const CategoriesProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.cursor,
                blurRadius: 1,
                spreadRadius: 0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Image.asset(
                  'assets/logos/product2.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 8.w,
                  left: 12.w,
                  top: 8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Frozen Chicken',
                      style: GoogleFonts.lato(
                        color: AppColors.arrowLeft,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'High-quality frozen chicken, ready to cook.',
                      style: GoogleFonts.lato(
                        color: AppColors.cursor,
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'EGP 200',
                      style: GoogleFonts.rubik(
                        color: AppColors.checkBox,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        RatingStars(
                          value: 3.7,
                          valueLabelVisibility: false,
                          starColor: AppColors.starRate,
                          starSize: 14.r,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '(124)',
                          style: GoogleFonts.lato(
                            color: AppColors.textRate,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const CategoriesAlertWidget(),
      ],
    );
  }
}
