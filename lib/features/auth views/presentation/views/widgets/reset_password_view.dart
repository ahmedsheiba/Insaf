import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Your Password",
                  style: GoogleFonts.rubik(
                      color: AppColors.secondary,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Enter your user account's verified email address and we will send you a password reset link.",
                  style: GoogleFonts.lato(
                      fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Email",
                  style: GoogleFonts.lato(
                      fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                CustomTextField(
                  controller: emailController,
                  isPassword: false,
                  hintText: 'Email Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your email";
                    }
                    if (!value.contains('@')) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
