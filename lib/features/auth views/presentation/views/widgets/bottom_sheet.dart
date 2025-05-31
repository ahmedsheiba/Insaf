import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/core/widgets/custom_button.dart';

void showAccountTypeBottomSheet(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 37.72800064086914.w,
              height: 4.191999912261963.h,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            SizedBox(height: height * 0.05),
            Text(
              "What type of account would you like to create?",
              style: GoogleFonts.rubik(
                  fontSize: 22.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.05),
            SizedBox(
              width: 345.w,
              height: 48.h,
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);

                  GoRouter.of(context)
                      .push(AppRouter.kCharityCreateAccountView);
                },
                text: 'charity',
                color: AppColors.primary,
                textColor: AppColors.white,
              ),
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              width: 345.w,
              height: 48.h,
              child: SizedBox(
                width: double.infinity,
                height: height * 0.06,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    GoRouter.of(context)
                        .push(AppRouter.kSellerCreateAccountView);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    side: const BorderSide(color: AppColors.primary),
                  ),
                  child: Text(
                    "Seller",
                    style: GoogleFonts.rubik(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
