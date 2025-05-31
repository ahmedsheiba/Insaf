import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/features/entry%20views/data/data.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/entry%20views/presentation/views/widgets/content_teplate.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int selectIndex = 0;
  int lastPageIndex = 2;
  PageController controller =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.7,
                child: PageView.builder(
                    controller: controller,
                    onPageChanged: (i) {
                      setState(() {
                        selectIndex = i;
                      });
                    },
                    itemCount: InsafOnboardData.onBoardItemList.length,
                    itemBuilder: (context, index) {
                      return ContentTemplate(
                        selectIndex: selectIndex,
                        item: InsafOnboardData.onBoardItemList[index],
                      );
                    }),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kWelcomeView);
                      },
                      child: Text(
                        'Skip',
                        style: GoogleFonts.rubik(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (selectIndex == lastPageIndex) {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.kWelcomeView);
                        } else {
                          controller.animateToPage(selectIndex + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        }
                      },
                      child: CircleAvatar(
                          radius: 35.r,
                          backgroundColor: AppColors.primary,
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30.w,
                            color: AppColors.white,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
