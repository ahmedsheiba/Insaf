import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/widgets/custom_button.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/cubit/reset_password_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/views/reset_verify_email.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, this.email});
  final String? email;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  bool get isEmailValid => EmailValidator.validate(emailController.text.trim());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.h),
        child: Form(
          key: formKey,
          child: Column(
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
              SizedBox(height: 8.h),
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
                  return null;
                },
              ),
              const Spacer(),
              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetVerifyEmailView(
                          email: emailController.text.trim(),
                        ),
                      ),
                    );
                  } else if (state is ResetPasswordFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onTap: isEmailValid && state is! ResetPasswordLoading
                        ? () {
                            if (formKey.currentState!.validate()) {
                              final email = emailController.text.trim();
                              final code = _otpController.text;
                              context
                                  .read<ResetPasswordCubit>()
                                  .sendResetCode(email: email, code: code);
                            }
                          }
                        : null,
                    text: state is ResetPasswordLoading
                        ? 'Sending...'
                        : 'Send Password Reset link',
                    textColor:
                        isEmailValid ? AppColors.white : AppColors.verifyColor,
                    color:
                        isEmailValid ? AppColors.primary : AppColors.verifyGrey,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
