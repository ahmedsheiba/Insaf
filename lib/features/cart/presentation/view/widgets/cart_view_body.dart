import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: const BackAndTitleAppBar(title: 'Cart'),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 16.h),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: CartItem(
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                minimumSize: WidgetStateProperty.all(
                  Size(double.infinity, 52.h),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                backgroundColor: const WidgetStatePropertyAll(
                  AppColors.editPenColor,
                ),
              ),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kCheckoutView);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '4 Items',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'EGP 460',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Checkout',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 38.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.r),
                        ),
                      ),
                      child: Icon(
                        LucideIcons.arrowRight,
                        size: 24.sp,
                        color: AppColors.editPenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
