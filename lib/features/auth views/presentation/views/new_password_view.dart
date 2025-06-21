import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/widgets/custom_button.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/cubit/reset_password_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key, this.email, this.code});
  final String? email;
  final String? code;

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              // Navigate to login or success screen here
            } else if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create new Password",
                    style: GoogleFonts.rubik(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "New Password",
                    style: GoogleFonts.lato(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomTextField(
                    controller: passwordController,
                    isPassword: true,
                    hintText: 'New Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter new password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Confirm New Password",
                    style: GoogleFonts.lato(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    isPassword: true,
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm your password";
                      } else if (value != passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    onTap: state is! ResetPasswordLoading
                        ? () {
                            if (formKey.currentState!.validate()) {
                              context.read<ResetPasswordCubit>().resetPassword(
                                    email: widget.email!,
                                    code: widget.code!,
                                    newPassword: passwordController.text,
                                  );
                            }
                          }
                        : null,
                    text: state is ResetPasswordLoading
                        ? 'Resetting...'
                        : 'Reset Password',
                    textColor: AppColors.white,
                    color: AppColors.primary,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
