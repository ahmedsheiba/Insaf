import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/widgets/custom_button.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/register/cubit/register_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/views/login_view.dart';
import 'package:insaf/features/auth%20views/presentation/views/verify_email.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/commercial_register.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/intl_phone_field.dart';

class CharityCreateAccountView extends StatefulWidget {
  const CharityCreateAccountView({super.key});

  @override
  State<CharityCreateAccountView> createState() =>
      _CharityCreateAccountViewState();
}

class _CharityCreateAccountViewState extends State<CharityCreateAccountView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? _commercialRegisterFile;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          "Charity",
          style: GoogleFonts.rubik(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: AppColors.white,
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VerifyEmailView(),
              ),
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMesage)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create An Account",
                        style: GoogleFonts.rubik(
                          color: AppColors.secondary,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text("Name",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      CustomTextField(
                        key: const ValueKey('nameField'),
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter Name";
                          } else if (value.length < 3) {
                            return "Name too short";
                          }
                          return null;
                        },
                        isPassword: false,
                        hintText: 'Name',
                      ),
                      SizedBox(height: height * 0.04),
                      Text("Email Address",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      CustomTextField(
                        key: const ValueKey('emailField'),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter Email";
                          } else if (!value.contains('@')) {
                            return "Invalid email format";
                          }
                          return null;
                        },
                        isPassword: false,
                        hintText: 'Email Address',
                      ),
                      SizedBox(height: height * 0.04),
                      Text("Phone number",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      CustomIntlPhoneField(
                        key: const ValueKey('phoneField'),
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value == null) {
                            return "Enter Phone Number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Text("Location",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      CustomTextField(
                        key: const ValueKey('locationField'),
                        controller: locationController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter Location";
                          }
                          return null;
                        },
                        isPassword: false,
                        hintText: 'Location',
                      ),
                      SizedBox(height: height * 0.04),
                      Text("Commercial register",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      UploadPhotoWidget(
                        onFileSelected: (file) {
                          setState(() {
                            _commercialRegisterFile = file;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.04),
                      state is RegisterLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (_commercialRegisterFile == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Please upload commercial register")),
                                    );
                                    return;
                                  }

                                  context.read<RegisterCubit>().charityRegister(
                                        name: nameController.text.trim(),
                                        email: emailController.text.trim(),
                                        location:
                                            locationController.text.trim(),
                                        phoneNumber:
                                            phoneNumberController.text.trim(),
                                        commercialRegister:
                                            _commercialRegisterFile!,
                                      );
                                }
                              },
                              text: 'Continue',
                              textColor: AppColors.white,
                              color: AppColors.primary,
                            ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                              style: GoogleFonts.lato(
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()),
                              );
                            },
                            child: Text(" Log In",
                                style: GoogleFonts.lato(
                                    fontSize: 14.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
