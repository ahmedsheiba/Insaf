import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BackAndTitleAppBar extends StatelessWidget {
  const BackAndTitleAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20.sp,
            ),
          ),
        ),
        SizedBox(width: 24.w),
        Text(
          title,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: AppColors.arrowLeft,
          ),
        )
      ],
    );
  }
}
