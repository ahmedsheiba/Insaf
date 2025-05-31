import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/presentation/views/widgets/categories_product_item.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  final List<Map<String, dynamic>> categories = [
    {"label": "All", "color": Colors.greenAccent.shade100},
    {
      "label": "Drinks",
      "image": 'assets/logos/Drinks.png',
      "color": Colors.blue.shade50
    },
    {
      "label": "Canned Products",
      "image": 'assets/logos/CannedFood.png',
      "color": Colors.purple.shade50
    },
    {
      "label": "Cakes",
      "image": 'assets/logos/Cakes.png',
      "color": Colors.pink.shade50
    },
    {
      "label": "Cooked Food",
      "image": 'assets/logos/Cooked.png',
      "color": Colors.pink.shade50
    },
    {
      "label": "Frozen Meat",
      "image": 'assets/logos/Frozen_Meat.png',
      "color": Colors.pink.shade50
    },
    {
      "label": "Bakery Products",
      "image": 'assets/logos/Bakery.png',
      "color": Colors.pink.shade50
    },
  ];

  CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          category,
          style: GoogleFonts.rubik(
            color: AppColors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => SizedBox(width: 8.w),
              itemBuilder: (context, index) {
                final item = categories[index];
                final isAll = item['label'] == 'All';

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: item['color']),
                  ),
                  child: Row(
                    children: [
                      if (isAll)
                        Text(
                          item['label'],
                          style: GoogleFonts.lato(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        )
                      else ...[
                        Image.asset(
                          item['image'],
                          width: 26.w,
                          height: 26.h,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          item['label'],
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ]
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                physics: const BouncingScrollPhysics(),
                itemCount: 12,
                addAutomaticKeepAlives: true,
                cacheExtent: 500,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 17,
                  crossAxisSpacing: 17,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const CategoriesProductItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
