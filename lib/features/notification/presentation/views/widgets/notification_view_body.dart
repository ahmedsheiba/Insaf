import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 40.w),
          const BackAndTitleAppBar(title: 'Notification'),
          SizedBox(height: 120.w),
          Image.asset('assets/logos/notification.png'),
          SizedBox(height: 20.w),
          Text(
            'You’re all caught up',
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 8.w),
          Text(
            'We ‘ll notify you once we have new notifications.',
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: AppColors.verifyColor,
            ),
          ),
          SizedBox(height: 120.w),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(345.w, 52.h),
              ),
              backgroundColor:
                  const WidgetStatePropertyAll(AppColors.editPenColor),
            ),
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.kNotificationSettingsView,
              );
            },
            child: Text(
              'Notification Settings',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
