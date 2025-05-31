import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:shimmer/shimmer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.forward();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) =>
          GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
          child: Shimmer.fromColors(
            baseColor: AppColors.primary, // Dark Green
            highlightColor: AppColors.secondary, // Light Green
            child: Image.asset(
              "assets/logos/insaf_logo.png",
              height: 127.61063385009766.h,
              width: 101.28026580810547.w,
            ),
          ),
        ),
      ),
    );
  }
}
