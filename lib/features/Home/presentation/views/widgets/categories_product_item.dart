import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/presentation/views/widgets/categories_alert_widget.dart';

class CategoriesProductItem extends StatelessWidget {
  const CategoriesProductItem({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  final String name;
  final String description;
  final num price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.arrowLeft.withOpacity(0.12),
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(0, 2),
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
                  image,
                  height: 110.h,
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
                      name,
                      style: GoogleFonts.lato(
                        color: AppColors.arrowLeft,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        color: AppColors.cursor,
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${price.toString()} EGP',
                      style: GoogleFonts.rubik(
                        color: AppColors.checkBox,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
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
