import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/constants.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/presentation/view%20model/surpluses%20cubit/surpluses_cubit.dart';

class SuggestedSection extends StatelessWidget {
  const SuggestedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurplusesCubit, SurplusesState>(
      builder: (context, state) {
        if (state is SurplusesSuccess) {
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
                  itemCount: state.surpluses.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 0.465.h,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.surpluses[index];
                    return Container(
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
                              images[index],
                              fit: BoxFit.cover,
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
                                  product.name,
                                  style: GoogleFonts.lato(
                                    color: AppColors.arrowLeft,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  product.description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    color: AppColors.cursor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  product.price.toString(),
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
                    );
                  },
                ),
              ],
            ),
          );
        } else if (state is SurplusesFailure) {
          return Center(
            child: Text(state.errorMesage),
          );
        } else if (state is SurplusesLoading) {
          return const CircularProgressIndicator();
        } else {
          return const Text('Un Expected error');
        }
      },
    );
  }
}
