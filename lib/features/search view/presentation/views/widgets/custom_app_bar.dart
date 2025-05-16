import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/filtration_bottom_sheet.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 23.r,
            backgroundColor: AppColors.verifyGrey,
            child: const Iconify(
              Ic.baseline_keyboard_arrow_left,
              color: AppColors.arrowLeft,
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: TextFormField(
            style: const TextStyle(color: AppColors.cursor),
            cursorColor: AppColors.cursor,
            decoration: const InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: AppColors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.searchTextField,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(48),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.searchTextField,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(48),
                ),
              ),
              prefixIcon: Icon(
                LucideIcons.search,
                color: AppColors.verifyColor,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        GestureDetector(
          onTap: () {
            showFiltrationBottomSheet(context);
          },
          child: CircleAvatar(
            radius: 23.r,
            backgroundColor: AppColors.primary,
            child: const Iconify(
              Carbon.settings_adjust,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
