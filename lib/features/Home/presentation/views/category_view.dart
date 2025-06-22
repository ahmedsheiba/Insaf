import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/constants.dart';
import 'package:insaf/core/utils/api_service.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/data/repos/categories%20repo/categories_repo_imple.dart';
import 'package:insaf/features/Home/presentation/view%20model/surpluses%20by%20categories/surpluses_by_categories_cubit.dart';
import 'package:insaf/features/Home/presentation/views/widgets/categories_product_item.dart';
import 'package:insaf/features/broduct%20details/presentation/views/broduct_details.dart';

class CategoryView extends StatelessWidget {
  final String category;

  CategoryView({super.key, required this.category});

  final List<Map<String, dynamic>> categories = [
    {
      "label": "All",
      "color": Colors.greenAccent.shade100,
    },
    {
      "label": "Canned Products",
      "image": 'assets/logos/CannedFood.png',
      "color": AppColors.cat1,
    },
    {
      "label": "Bakery Products",
      "image": 'assets/logos/Bakery.png',
      "color": AppColors.cat2,
    },
    {
      "label": "Frozen Meat",
      "image": 'assets/logos/Frozen_Meat.png',
      "color": AppColors.cat3,
    },
    {
      "label": "Cooked Food",
      "image": 'assets/logos/Cooked.png',
      "color": AppColors.cat2,
    },
    {
      "label": "Drinks",
      "image": 'assets/logos/Drinks.png',
      "color": AppColors.cat3,
    },
    {
      "label": "Cakes",
      "image": 'assets/logos/Cakes.png',
      "color": AppColors.cat1,
    },
  ];

  final categoriesCubit = CategoriesRepoImplement(ApiService(Dio()));

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
      body: BlocProvider(
        create: (context) {
          final index =
              categories.indexWhere((element) => element['label'] == category);
          return SurplusesByCategoriesCubit(categoriesCubit)
            ..fetchSurplusesByCate(index + 1);
        },
        child: Column(
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

                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<SurplusesByCategoriesCubit>(context)
                          .fetchSurplusesByCate(index + 1);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.w,
                      ),
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
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            BlocBuilder<SurplusesByCategoriesCubit, SurplusesByCategoriesState>(
              builder: (context, state) {
                if (state is SurplusesByCategoriesSuccess) {
                  var surpluses = state.surpluses;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        physics: const BouncingScrollPhysics(),
                        itemCount: surpluses.length,
                        addAutomaticKeepAlives: true,
                        cacheExtent: 500,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          mainAxisSpacing: 17,
                          crossAxisSpacing: 17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetailsView(
                                      name: surpluses[index].name,
                                      description: surpluses[index].description,
                                      price: surpluses[index].price,
                                      image: images[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: CategoriesProductItem(
                              name: surpluses[index].name,
                              description: surpluses[index].description,
                              price: surpluses[index].price,
                              image: images[index],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else if (state is SurplusesByCategoriesLoading) {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.editPenColor,
                        ),
                      ],
                    ),
                  );
                } else if (state is SurplusesByCategoriesFailure) {
                  return Center(
                    child: Text(state.errorMesage),
                  );
                } else {
                  return const Text('Un known Error');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
