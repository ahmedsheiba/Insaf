import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/custom_switcher.dart';

class CustomNotificationSetting extends StatefulWidget {
  const CustomNotificationSetting({super.key, required this.title});

  final String title;

  @override
  State<CustomNotificationSetting> createState() =>
      _CustomNotificationSettingState();
}

class _CustomNotificationSettingState extends State<CustomNotificationSetting> {
  bool isFree = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.arrowLeft,
          ),
        ),
        const Spacer(),
        CustomSwitcher(
          value: isFree,
          onChanged: (value) {
            setState(
              () {
                isFree = value;
              },
            );
          },
        ),
      ],
    );
  }
}
