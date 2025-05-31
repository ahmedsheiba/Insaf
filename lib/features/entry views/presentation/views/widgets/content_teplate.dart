import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/features/entry%20views/data/data.dart';
import 'package:insaf/model/onboarding_model.dart';
import 'package:insaf/core/utils/app_colors.dart';

// ignore: must_be_immutable
class ContentTemplate extends StatelessWidget {
  ContentTemplate({
    super.key,
    required this.item,
    required this.selectIndex,
  });
  int selectIndex;
  final OnBoardItems item;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(item.image),
        SizedBox(
          height: size.height * 0.06,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              InsafOnboardData.onBoardItemList.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
                height: 8,
                width: selectIndex == index ? 24 : 8,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color:
                      selectIndex == index ? AppColors.primary : AppColors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          item.title,
          style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        Text(
          item.shortDescription,
          style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
