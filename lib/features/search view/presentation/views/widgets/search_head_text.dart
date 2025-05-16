import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHeadText extends StatelessWidget {
  const SearchHeadText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12.sp,
          color: const Color(
            0xffB3B3B3,
          ),
        ),
      ),
    );
  }
}
