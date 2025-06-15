import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/prime.dart';
import 'package:iconify_flutter/icons/uiw.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_button.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/data_section.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/profile_slices.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          const CustomProfileAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
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
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kEditProfileView,
                    );
                  },
                ),
                SizedBox(height: 16.h),
                ProfileSlices(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kSettingsView,
                    );
                  },
                  icon: const Iconify(
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
                ProfileSlices(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                          maxHeight: MediaQuery.of(context).size.height * 0.37),
                      builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, bottom: 26.h),
                              child: SizedBox(
                                width: 38.w,
                                child: const Divider(
                                  color: Color.fromRGBO(230, 230, 230, 1),
                                  height: 3,
                                  thickness: 4,
                                ),
                              ),
                            ),
                            Text(
                              'Log out',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 22.sp,
                                color: const Color(0xffE74C3C),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            SizedBox(
                              width: 280.w,
                              child: const Divider(
                                color: Color.fromRGBO(204, 204, 204, 0.35),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Are you sure you want to log out?',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: AppColors.arrowLeft,
                              ),
                            ),
                            SizedBox(height: 28.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: const WidgetStatePropertyAll(
                                        EdgeInsets.zero),
                                    fixedSize: WidgetStateProperty.all(
                                        Size(164.w, 48.h)),
                                    backgroundColor: WidgetStateProperty.all(
                                      const Color(0xffE6F9EE),
                                    ),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: GoogleFonts.rubik(
                                      color: AppColors.editPenColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: const WidgetStatePropertyAll(
                                        EdgeInsets.zero),
                                    fixedSize: WidgetStateProperty.all(
                                        Size(164.w, 48.h)),
                                    backgroundColor: WidgetStateProperty.all(
                                      AppColors.editPenColor,
                                    ),
                                  ),
                                  child: Text(
                                    'Yes, Logout',
                                    style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: const Iconify(
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
    );
  }
}
