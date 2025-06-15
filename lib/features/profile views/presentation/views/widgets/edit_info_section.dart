import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/intl_phone_field.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/custom_image_upload_widget.dart';

class EditInfoSection extends StatelessWidget {
  EditInfoSection({super.key});

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            letterSpacing: 1,
            color: AppColors.arrowLeft,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          decoration: InputDecoration(
            hintText: 'Misr Elkheir',
            hintStyle: GoogleFonts.lato(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              color: AppColors.arrowLeft,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.cursor.withOpacity(0.5),
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Email Address',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            letterSpacing: 1,
            color: AppColors.arrowLeft,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          decoration: InputDecoration(
            hintText: 'Misr_Elkher@gmail.com',
            hintStyle: GoogleFonts.lato(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              color: AppColors.arrowLeft,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.cursor.withOpacity(0.5),
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Email Address',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            letterSpacing: 1,
            color: AppColors.arrowLeft,
          ),
        ),
        SizedBox(height: 8.h),
        CustomIntlPhoneField(
          key: const ValueKey('phoneField'),
          controller: phoneNumberController,
          validator: (value) {
            if (value == null) {
              return "Enter Phone Number";
            }
            return null;
          },
        ),
        Text(
          'Location',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            letterSpacing: 1,
            color: AppColors.arrowLeft,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          decoration: InputDecoration(
            hintStyle: GoogleFonts.lato(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              color: AppColors.arrowLeft,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.cursor.withOpacity(0.5),
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        const CustomImageUploadWidget(),
        SizedBox(height: 48.h),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(345.w, 52.h),
              ),
              backgroundColor:
                  const WidgetStatePropertyAll(AppColors.editPenColor),
            ),
            onPressed: () {},
            child: Text(
              'Save Changes',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
