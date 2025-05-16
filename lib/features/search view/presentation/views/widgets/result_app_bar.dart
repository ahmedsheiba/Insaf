import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:insaf/core/utils/app_colors.dart';

class ResultAppBar extends StatelessWidget {
  const ResultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 0,
            blurRadius: 14,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 24.w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: 23.r,
                  backgroundColor: AppColors.verifyGrey,
                  child: const Iconify(
                    Ic.baseline_keyboard_arrow_left,
                    color: AppColors.arrowLeft,
                  ),
                ),
              ),
              SizedBox(
                width: 60.w,
              ),
              Text(
                'Result Products',
                style: GoogleFonts.lato(
                  color: AppColors.arrowLeft,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
