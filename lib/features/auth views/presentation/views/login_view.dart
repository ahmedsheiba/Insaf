import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/core/widgets/custom_button.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';
import 'package:insaf/features/auth%20views/presentation/views/charity/create_account.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "Email",
                style: GoogleFonts.lato(
                    fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              const CustomTextField(
                  isPassword: false, hintText: 'Email Address'),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "Password",
                style: GoogleFonts.lato(
                    fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              const CustomTextField(isPassword: true, hintText: 'Password'),
              SizedBox(
                height: height * 0.005,
              ),
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
                      SizedBox(
                        width: width * 0.01,
                      ),
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
                    onPressed: () {},
                    child: Text(
                      "Forget Password?",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.h,
              ),
              CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kMainView);
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
  }
}
