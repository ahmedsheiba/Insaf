import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/prime.dart';
import 'package:iconify_flutter/icons/uiw.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_button.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/data_section.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/profile_slices.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const CustomProfileAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h),
                  const CustomBackButton(),
                  SizedBox(height: 35.h),
                  const DataSection(),
                  SizedBox(height: 30.h),
                  ProfileSlices(
                    icon: Iconify(
                      Prime.user_edit,
                      size: 32.sp,
                      color: AppColors.primary,
                    ),
                    title: 'Edit Profile',
                  ),
                  SizedBox(height: 16.h),
                  const ProfileSlices(
                    icon: Iconify(
                      Uiw.setting_o,
                      color: AppColors.primary,
                    ),
                    title: 'Settings',
                  ),
                  SizedBox(height: 16.h),
                  const ProfileSlices(
                    icon: Icon(
                      LucideIcons.messageCircle,
                      color: AppColors.primary,
                    ),
                    title: 'Help Center',
                  ),
                  SizedBox(height: 16.h),
                  const ProfileSlices(
                    icon: Iconify(
                      Majesticons.shield_check_line,
                      color: AppColors.primary,
                    ),
                    title: 'Privacy Policy',
                  ),
                  SizedBox(height: 16.h),
                  const ProfileSlices(
                    icon: Iconify(
                      Ic.baseline_logout,
                      color: AppColors.primary,
                    ),
                    title: 'Log Out',
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
