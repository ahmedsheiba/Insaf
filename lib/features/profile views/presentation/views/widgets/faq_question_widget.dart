import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:insaf/core/utils/app_colors.dart';

class InsafInfoWidget extends StatefulWidget {
  const InsafInfoWidget({super.key});

  @override
  _InsafInfoWidgetState createState() => _InsafInfoWidgetState();
}

class _InsafInfoWidgetState extends State<InsafInfoWidget> {
  // Track expanded state for all sections
  bool whatIsInsafExpanded = true; // First section expanded by default
  bool whoCanUseExpanded = false;
  bool updateProfileExpanded = false;
  bool deleteAccountExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),

          // "What Is Insaf?" section (now interactive)
          _buildInteractiveSection(
            title: "What Is Insaf?",
            isExpanded: !whatIsInsafExpanded,
            content:
                "Insaf connects surplus food providers with charities to reduce food waste.",
            onTap: () {
              setState(() {
                whatIsInsafExpanded = !whatIsInsafExpanded;
              });
            },
          ),

          SizedBox(height: 16.h),

          // "Who Can Use Insaf?" section
          _buildInteractiveSection(
            title: "Who Can Use Insaf?",
            isExpanded: whoCanUseExpanded,
            content:
                "Any food provider with surplus food or registered charity can use Insaf to connect and reduce food waste.",
            onTap: () {
              setState(() {
                whoCanUseExpanded = !whoCanUseExpanded;
              });
            },
          ),

          SizedBox(height: 16.h),

          // "How Do I Update My Profile?" section
          _buildInteractiveSection(
            title: "How Do I Update My Profile?",
            isExpanded: updateProfileExpanded,
            content:
                "Go to your profile page, tap the edit button, make your changes, and save them.",
            onTap: () {
              setState(() {
                updateProfileExpanded = !updateProfileExpanded;
              });
            },
          ),

          SizedBox(height: 16.h),

          // "How Do I Delete My Account?" section
          _buildInteractiveSection(
            title: "How Do I Delete My Account?",
            isExpanded: deleteAccountExpanded,
            content:
                "Go to account settings, select 'Delete Account', confirm your choice, and your account will be permanently removed.",
            onTap: () {
              setState(() {
                deleteAccountExpanded = !deleteAccountExpanded;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveSection({
    required String title,
    required bool isExpanded,
    required String content,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color.fromRGBO(204, 204, 204, 0.35)),
        ),
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: AppColors.arrowLeft,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Iconify(
                  isExpanded ? Eva.arrow_up_fill : Eva.arrow_down_fill,
                  color: AppColors.editPenColor,
                  size: 20.sp,
                ),
              ],
            ),
            if (isExpanded) ...[
              SizedBox(height: 12.h),
              const Divider(color: Color.fromRGBO(204, 204, 204, 0.35)),
              SizedBox(height: 12.h),
              Text(
                content,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.checkBox,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
