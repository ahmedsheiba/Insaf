import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TextFieldInsaf extends StatelessWidget {
  const TextFieldInsaf({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      cursorHeight: 18.sp,
      decoration: InputDecoration(
        focusColor: const Color(0xffE6F9EE),
        hintText: 'Search',
        hintStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w400,
          fontSize: 17.sp,
          color: const Color(0xffB3B3B3),
        ),
        fillColor: const Color(0xffF4F4F4),
        filled: true,
        prefixIcon: const Icon(
          LucideIcons.search,
          size: 18,
        ),
        prefixIconColor: const Color(0xffB3B3B3),
        suffixIcon: const Padding(
          padding: EdgeInsets.all(8.0), // Maintains tap area
          child: IconTheme(
            data: IconThemeData(size: 12),
            child: Iconify(
              Carbon.settings_adjust,
              color: AppColors.primary,
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 40, // Minimum touch target size (recommended 48px)
          minHeight: 40,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: AppColors.editPenColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
