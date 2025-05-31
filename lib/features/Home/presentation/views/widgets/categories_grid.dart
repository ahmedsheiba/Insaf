import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/presentation/views/category_view.dart';

class CategoriesSection extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      "title": "Canned Products",
      "image": 'assets/logos/CannedFood.png',
      "color": AppColors.cat1,
    },
    {
      "title": "Bakery Products",
      "image": 'assets/logos/Bakery.png',
      "color": AppColors.cat2,
    },
    {
      "title": "Frozen Meat",
      "image": 'assets/logos/Frozen_Meat.png',
      "color": AppColors.cat3,
    },
    {
      "title": "Cooked Food",
      "image": 'assets/logos/Cooked.png',
      "color": AppColors.cat2,
    },
    {
      "title": "Drinks",
      "image": 'assets/logos/Drinks.png',
      "color": AppColors.cat3,
    },
    {
      "title": "Cakes",
      "image": 'assets/logos/Cakes.png',
      "color": AppColors.cat1,
    },
  ];

  CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.w, left: 24.w, right: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: GoogleFonts.rubik(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cursor),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "See all",
                  style: GoogleFonts.rubik(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final item = categories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryPage(category: item['title']),
                    ),
                  );
                },
                child: Container(
                  width: 105.w,
                  height: 76.h,
                  decoration: BoxDecoration(
                    color: item['color'],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(item['image'], width: 28.w, height: 28.h),
                      SizedBox(height: 13.h),
                      Text(
                        item['title'],
                        style: GoogleFonts.lato(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.arrowLeft),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
