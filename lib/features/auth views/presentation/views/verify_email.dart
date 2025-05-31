import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/widgets/custom_button.dart';
import 'package:insaf/features/auth%20views/presentation/views/charity/charity_approval.dart';

import 'package:pinput/pinput.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailView> {
  final TextEditingController _otpController = TextEditingController();
  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;

  @override
  void initState() {
    super.initState();

    defaultPinTheme = PinTheme(
      width: 78.w,
      height: 52.h,
      textStyle: GoogleFonts.lato(
        fontSize: 18.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black, width: 1.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary, width: 2.w),
      borderRadius: BorderRadius.circular(8.r),
    );

    _otpController.addListener(() {
      setState(() {});
    });
  }

  void _verifyOTP() {
    String otp = _otpController.text;
    if (otp.length == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP Verified: $otp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verify Your Email",
              style: GoogleFonts.rubik(
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 8.h),
            const Text(
              "We just sent your authentication code via email to *********@gmail.com. The code will expire in 10 minutes.",
            ),
            SizedBox(height: 40.h),
            Center(
              child: Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                length: 4,
                preFilledWidget: Text('-',
                    style: GoogleFonts.lato(
                        color: AppColors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700)),
                controller: _otpController,
                onCompleted: (pin) => _verifyOTP(),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Resend OTP logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Resend Code clicked')),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Don't receive code?",
                    style: GoogleFonts.lato(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Resend Code",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CharityApproval(),
                  ),
                );
              },
              text: 'Verify',
              textColor: _otpController.text.length == 4
                  ? AppColors.white
                  : AppColors.verifyColor,
              color: _otpController.text.length == 4
                  ? AppColors.primary
                  : AppColors.verifyGrey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
