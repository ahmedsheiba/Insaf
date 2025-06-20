import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.imageHeight,
    required this.imageName,
    required this.imageWidth,
    required this.paymentMethod,
    required this.isSelected,
    required this.onTap,
  });
  final double imageWidth;
  final double imageHeight;
  final String imageName;
  final String paymentMethod;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 78.w,
            height: 65.h,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.white : AppColors.greenWithOpacity,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 1.w,
              ),
            ),
            child: Image.asset(
              'assets/logos/$imageName.png',
              width: imageWidth.w,
              height: imageHeight.h,
            ),
          ),
        ),
        Text(
          paymentMethod,
          style: GoogleFonts.lato(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
