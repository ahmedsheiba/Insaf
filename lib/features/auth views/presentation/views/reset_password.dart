import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/widgets/custom_button.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';
import 'package:insaf/features/auth%20views/presentation/views/verify_email.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(24.h),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Your Password",
                style: GoogleFonts.rubik(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                ),
              ),
              Text(
                "Enter your user account's verified email address and we will send you a password reset link.",
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Email",
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                isPassword: false,
                hintText: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email";
                  }
                  if (!EmailValidator.validate(value)) {
                    return "Enter a valid email";
                  }
                  return null; // This indicates validation is successful
                },
              ),
              SizedBox(height: 16.h),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    log('Success');
                    emailController.clear();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyEmailView(),
                      ),
                    );
                  }
                },
                text: 'Verify',
                textColor: AppColors.verifyColor,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
