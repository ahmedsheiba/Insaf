import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/constants.dart'; // assuming categories list is here
import 'package:insaf/core/utils/app_colors.dart';

class CategoriesButtons extends StatefulWidget {
  const CategoriesButtons({super.key});

  @override
  State<CategoriesButtons> createState() => _CategoriesButtonsState();
}

class _CategoriesButtonsState extends State<CategoriesButtons> {
  Set<int> selectedIndexes = {}; // track multiple selected indexes

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: categoriesLabelsOnly.asMap().entries.map(
        (entry) {
          int index = entry.key;
          String category = entry.value;
          bool isSelected = selectedIndexes.contains(index);

          return OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: isSelected ? AppColors.primary : Colors.white,
              side: BorderSide(
                color: AppColors.primary,
                width: 1.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 10.h,
              ),
            ),
            onPressed: () {
              setState(
                () {
                  if (isSelected) {
                    selectedIndexes
                        .remove(index); // unselect if already selected
                  } else {
                    selectedIndexes.add(index); // select new
                  }
                },
              );
            },
            child: Text(
              category,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: isSelected ? Colors.white : AppColors.checkBox,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
