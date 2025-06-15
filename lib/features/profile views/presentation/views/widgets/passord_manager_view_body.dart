import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/custom_text_form_field.dart';

class PassordManagerViewBody extends StatelessWidget {
  const PassordManagerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          const BackAndTitleAppBar(
            title: 'Password Manager',
          ),
          SizedBox(height: 28.h),
          Text(
            'Current password',
            style: GoogleFonts.lato(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 6.h),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const CustomTextFormField(hintText: 'Current Password'),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'forget password?',
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.editPenColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'New Password',
            style: GoogleFonts.lato(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 6.h),
          const CustomTextFormField(hintText: 'New Password'),
          SizedBox(height: 24.h),
          Text(
            'Confirm New Password',
            style: GoogleFonts.lato(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 6.h),
          const CustomTextFormField(hintText: 'Confirm New Password'),
          SizedBox(height: MediaQuery.of(context).size.width * 0.45),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(345.w, 52.h),
              ),
              backgroundColor:
                  const WidgetStatePropertyAll(AppColors.editPenColor),
            ),
            onPressed: () {},
            child: Text(
              'Update Password',
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
