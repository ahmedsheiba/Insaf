import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/core/widgets/custom_button.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/cubit/login_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/views/charity/create_account.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white),
      backgroundColor: AppColors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            GoRouter.of(context).push(AppRouter.kMainView);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.h),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Log In",
                      style: GoogleFonts.rubik(
                          color: AppColors.secondary,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Welcome back, Log in to access your account.",
                      style: GoogleFonts.lato(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: height * 0.04),
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
                    SizedBox(height: height * 0.04),
                    Text(
                      "Password",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    CustomTextField(
                      controller: passwordController,
                      isPassword: true,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your password";
                        } else if (value.length < 6) {
                          return "Password too short";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 19.w,
                              height: 19.h,
                              child: Checkbox(
                                activeColor: AppColors.primary,
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              "Remember Me",
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouter.kResetPasswordView);
                          },
                          child: Text(
                            "Forget Password?",
                            style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 48.h),
                    state is LoginLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginCubit>().loginUser(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                              }
                            },
                            text: 'Log In',
                            color: AppColors.greenWithOpacity,
                            textColor: AppColors.primary,
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CharityCreateAccountView(),
                              ),
                            );
                          },
                          child: Text(
                            " Sign up",
                            style: GoogleFonts.lato(
                                fontSize: 14.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
