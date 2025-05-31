import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class SellerApproval extends StatelessWidget {
  const SellerApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos/approval.png'),
            Text(
              "Wait for Approval",
              style: GoogleFonts.rubik(
                  fontSize: 20.sp, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
