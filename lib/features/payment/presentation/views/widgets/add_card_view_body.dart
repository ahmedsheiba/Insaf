import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/auth%20views/presentation/views/widgets/custom_text_field.dart';

class AddCardViewBody extends StatefulWidget {
  const AddCardViewBody({super.key});

  @override
  State<AddCardViewBody> createState() => _AddCardViewBodyState();
}

class _AddCardViewBodyState extends State<AddCardViewBody> {
  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expireDateController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  bool _saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Your Card Information',
              style: GoogleFonts.rubik(
                color: AppColors.primary,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Card Holder Name',
              style: GoogleFonts.lato(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextField(
              isPassword: false,
              hintText: 'Card Holder Name',
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Name";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Card Number',
              style: GoogleFonts.lato(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextField(
              isPassword: false,
              keyboardType: TextInputType.number,
              hintText: 'Card Number',
              controller: cardNumberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Card Number";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Expire Date',
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        isPassword: false,
                        keyboardType: TextInputType.datetime,
                        hintText: '__/__',
                        controller: expireDateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Expire Date";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'CVV',
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        isPassword: false,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        hintText: '***',
                        controller: cvvController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter CVV";
                          }
                          return null;
                        },
                        buildCounter: (
                          context, {
                          required int currentLength,
                          required bool isFocused,
                          required int? maxLength,
                        }) {
                          return null;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 19.w,
                  height: 19.h,
                  child: Checkbox(
                    activeColor: AppColors.primary,
                    value: _saveCard,
                    onChanged: (value) {
                      setState(() {
                        _saveCard = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "Save Card",
                  style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 52.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    AppColors.primary,
                  ),
                  overlayColor:
                      const WidgetStatePropertyAll(AppColors.greenWithOpacity),
                  elevation: const WidgetStatePropertyAll(0),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Add & make payment',
                  style: GoogleFonts.lato(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
