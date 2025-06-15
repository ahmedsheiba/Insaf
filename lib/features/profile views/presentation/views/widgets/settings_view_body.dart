import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/mi.dart';
import 'package:iconify_flutter/icons/vaadin.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/profile_slices.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          const BackAndTitleAppBar(
            title: 'Settings',
          ),
          SizedBox(height: 28.h),
          ProfileSlices(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kNotificationSettingsView,
              );
            },
            icon: Iconify(
              Mdi.bell_notification_outline,
              size: 32.sp,
              color: AppColors.primary,
            ),
            title: 'Notification Settings',
          ),
          SizedBox(height: 16.h),
          ProfileSlices(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kPasswordManagerView,
              );
            },
            icon: Iconify(
              Vaadin.password,
              size: 32.sp,
              color: AppColors.primary,
            ),
            title: 'Password Manager',
          ),
          SizedBox(height: 16.h),
          ProfileSlices(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kDeleteAccountView,
              );
            },
            icon: Iconify(
              Mi.delete,
              size: 32.sp,
              color: AppColors.primary,
            ),
            title: 'Delete Account',
          ),
        ],
      ),
    );
  }
}
