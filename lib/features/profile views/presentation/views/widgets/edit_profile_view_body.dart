import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/custom_profile_image.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/edit_info_section.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          const BackAndTitleAppBar(
            title: 'Edit Profile',
          ),
          SizedBox(height: 26.h),
          const CustomProfileImage(),
          SizedBox(height: 26.h),
          EditInfoSection(),
        ],
      ),
    );
  }
}
