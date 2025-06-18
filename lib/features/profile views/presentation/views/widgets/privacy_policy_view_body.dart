import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';

class PrivacyPloicyViewBody extends StatelessWidget {
  const PrivacyPloicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          const BackAndTitleAppBar(
            title: 'Privacy Policy',
          ),
          SizedBox(height: 28.h),
          Text(
            '1. Information We Collect',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 22.h),
          Text(
            'Personal Information: ',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'When you create an account or use our services, we may collect personal information that can identify you, such as your name, email address, phone number, and payment information.',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            'Usage Data:',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'We may also collect information about how you access and use our website, including your IP address, browser type, device information, pages visited, and the time and date of your visit.',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            'Technical Information:',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'IP address, device type, operating system, browser type.',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 27.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 27.h),
          Text(
            '2. How We Use Your Information',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '''We use the information we collect for various purposes, including:

- To provide and maintain our services
- To personalize your experience
- To communicate with you regarding your account or services
- To process transactions and manage billing
- To improve our website and services through analytics
- To send you promotional content and updates (you can opt out at any time)
- To comply with legal obligations''',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 27.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 27.h),
          Text(
            '3. Disclosure of Your Information',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'We do not sell or rent your personal information to third parties. We may share your information in the following situations:',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'With Service Providers:',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'We may share your information with third-party service providers who assist us in operating our website and delivering our services.',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'For Legal Reasons:',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'We may disclose your information if required to do so by law or in response to valid requests by public authorities.',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Business Transfers:',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'If Insaf is involved in a merger, acquisition, or asset sale, your personal information may be transferred as part of that transaction.',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 27.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 27.h),
          Text(
            '4. Data Security',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '''We take reasonable measures to protect the information we collect from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security.''',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 27.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 27.h),
          Text(
            '5. Your Rights',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '''Depending on your location and applicable laws, you may have certain rights regarding your personal information, including:

- The right to access the personal information we hold about you.
- The right to request correction of inaccurate or incomplete data.
- The right to request deletion of your personal information.
- The right to withdraw consent where we rely on consent to process your personal information.''',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 27.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 27.h),
          Text(
            '6. Third-Party Links',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '''Our website may contain links to third-party websites that are not operated by us. If you click on a third-party link, you will be directed to that third.''',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 27.h),
          const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
          SizedBox(height: 27.h),
          Text(
            '7. Changes to This Privacy Policy',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.arrowLeft,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '''We may update this policy periodically. Any changes will be posted here with an updated revision date. Please review this page regularly for updates.

Last Updated: [24-4-2023]''',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.checkBox,
            ),
          ),
          SizedBox(height: 27.h),
        ],
      ),
    );
  }
}
