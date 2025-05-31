import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/bottom_sheet.dart';
import 'package:insaf/core/widgets/custom_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome! 👋",
                style: GoogleFonts.rubik(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Your partner in reducing food waste,\njoin us to make an impact.",
                style: GoogleFonts.rubik(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.05),
              SizedBox(
                width: 345.w,
                height: 52.h,
                child: CustomButton(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                  text: 'Log In',
                  color: AppColors.primary,
                  textColor: AppColors.white,
                ),
              ),
              SizedBox(height: height * 0.015),
              SizedBox(
                width: 345.w,
                height: 52.h,
                child: CustomButton(
                  onTap: () {
                    showAccountTypeBottomSheet(context);
                  },
                  text: 'Sign Up',
                  color: AppColors.greenWithOpacity,
                  textColor: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
