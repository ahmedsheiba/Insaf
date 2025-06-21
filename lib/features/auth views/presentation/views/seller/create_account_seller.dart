import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/widgets/custom_button.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/register/cubit/register_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/views/verify_email.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/commercial_register.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/intl_phone_field.dart';

class SellerCreateAccountView extends StatefulWidget {
  const SellerCreateAccountView({super.key});

  @override
  State<SellerCreateAccountView> createState() =>
      _SellerCreateAccountViewState();
}

class _SellerCreateAccountViewState extends State<SellerCreateAccountView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? _commercialRegisterFile;
  File? _healthCertificateFile;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Seller",
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
                builder: (context) =>
                    VerifyEmailView(email: emailController.text.trim()),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create An Account",
                        style: GoogleFonts.rubik(
                            color: AppColors.secondary,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 24.h),
                      Text("Name",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      CustomTextField(
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
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter Email";
                          } else if (!value.contains('@')) {
                            return "Invalid Email";
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
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value == null || value.number.trim().isEmpty) {
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
                      Text("Health Certificate",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      UploadPhotoWidget(
                        onFileSelected: (file) {
                          setState(() {
                            _healthCertificateFile = file;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.04),
                      state is RegisterLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (_commercialRegisterFile == null ||
                                      _healthCertificateFile == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Please upload all required documents")),
                                    );
                                    return;
                                  }

                                  context
                                      .read<RegisterCubit>()
                                      .supplierRegister(
                                        name: nameController.text.trim(),
                                        email: emailController.text.trim(),
                                        location:
                                            locationController.text.trim(),
                                        phoneNumber:
                                            phoneNumberController.text.trim(),
                                        commercialRegister:
                                            _commercialRegisterFile!,
                                        healthCertificate:
                                            _healthCertificateFile!,
                                      );
                                }
                              },
                              text: 'Continue',
                              textColor: AppColors.white,
                              color: AppColors.primary,
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
