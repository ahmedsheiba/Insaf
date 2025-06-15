import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/custom_notification_setting.dart';

class NotificationSettingsViewBody extends StatelessWidget {
  const NotificationSettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          const BackAndTitleAppBar(
            title: 'Notification Settings',
          ),
          SizedBox(height: 28.h),
          Text(
            'Common',
            style: GoogleFonts.lato(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 21.h),
          const CustomNotificationSetting(title: 'General Notification'),
          SizedBox(height: 8.h),
          const CustomNotificationSetting(title: 'Sounds'),
          SizedBox(height: 8.h),
          const CustomNotificationSetting(title: 'Call Sound'),
          SizedBox(height: 8.h),
          const CustomNotificationSetting(title: 'Vibration'),
          SizedBox(height: 27.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 27.h),
          Text(
            'Others',
            style: GoogleFonts.lato(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 12.h),
          const CustomNotificationSetting(title: 'Order Updates'),
          SizedBox(height: 8.h),
          const CustomNotificationSetting(title: 'Promotions & Offers'),
          SizedBox(height: 8.h),
          const CustomNotificationSetting(title: 'General Announcements'),
          SizedBox(height: 27.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 27.h),
          Text(
            'Choose Notification Type',
            style: GoogleFonts.lato(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 12.h),
          const CustomNotificationSetting(title: 'Push Notifications'),
          SizedBox(height: 8.h),
          const CustomNotificationSetting(title: 'Email Notifications'),
          SizedBox(height: 8.h),
          const CustomNotificationSetting(title: 'SMS Notifications'),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
