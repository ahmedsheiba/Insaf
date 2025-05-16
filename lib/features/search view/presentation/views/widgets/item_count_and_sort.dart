import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:insaf/core/utils/app_colors.dart';

class ItemCountAndSort extends StatelessWidget {
  const ItemCountAndSort({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '50+ Items',
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.17,
          ),
        ),
        Container(
          width: 67.w,
          height: 31.h,
          decoration: const BoxDecoration(
            color: AppColors.sortContainer,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Iconify(
                Ri.arrow_up_down_fill,
                color: AppColors.arrowLeft,
                size: 14,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                'Sort',
                style: GoogleFonts.lato(
                  color: AppColors.checkBox,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
