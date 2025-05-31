import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

// ignore: must_be_immutable
class CustomIntlPhoneField extends StatelessWidget {
  CustomIntlPhoneField({
    super.key,
    required this.controller,
    required this.validator,
  });

  TextEditingController controller = TextEditingController();
  FutureOr<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
      ),
      initialCountryCode: 'EG',
      onChanged: (phone) {},
    );
  }
}
