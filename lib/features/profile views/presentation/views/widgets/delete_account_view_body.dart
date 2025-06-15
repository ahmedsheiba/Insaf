import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/custom_rich_text.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/custom_text_form_field.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/delete_custom_check.dart';

class DeleteAccountViewBody extends StatelessWidget {
  DeleteAccountViewBody({super.key});

  final ValueNotifier<bool> isCheckedNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          const BackAndTitleAppBar(
            title: 'Delete Account',
          ),
          SizedBox(height: 28.h),
          Text(
            'Are you sure you want to delete your account?',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'We’re sorry to see you go! Deleting your account is permanent and cannot be undone. This action will remove all your data, including workout history, meal plans, and any saved preferences.',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.cursor,
            ),
          ),
          SizedBox(height: 24.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 24.h),
          Text(
            'Important Information',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 20.h),
          const CustomRichText(
            title: 'Data Loss: ',
            subTitle:
                'All your fitness progress, personal data, and settings will be permanently deleted.',
          ),
          SizedBox(height: 14.h),
          const CustomRichText(
            title: 'Subscription Status:  ',
            subTitle:
                'If you have an active subscription, it will be canceled immediately, and you will not be charged again..',
          ),
          SizedBox(height: 14.h),
          const CustomRichText(
            title: 'Reactivation: ',
            subTitle:
                'Once your account is deleted, you will not be able to reactivate it or recover any of your data.',
          ),
          SizedBox(height: 24.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 24.h),
          DeleteCustomCheck(
            onChanged: (value) {
              isCheckedNotifier.value = value;
            },
          ),

          // Add this ValueListenableBuilder at the bottom
          ValueListenableBuilder<bool>(
            valueListenable: isCheckedNotifier,
            builder: (context, isChecked, child) {
              if (!isChecked) return const SizedBox.shrink();
              return Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Your Password',
                      style: GoogleFonts.lato(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.arrowLeft,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    const CustomTextFormField(hintText: 'Password'),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(
                          Size(345.w, 52.h),
                        ),
                        backgroundColor: const WidgetStatePropertyAll(
                          Color(0xffE74C3C),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Delete My Account',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
