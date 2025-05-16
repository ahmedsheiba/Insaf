import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/categories_buttons.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/check_box_row.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/custom_cost_range_slider.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/custom_date_range_slider.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/custom_switcher.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/distance_slider.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/post_fix_text.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/sheet_head_text.dart';
import 'package:lucide_icons/lucide_icons.dart';

void showFiltrationBottomSheet(context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      bool isFree = false;

      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        LucideIcons.filter,
                        color: AppColors.filterIcon,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Filter'.toUpperCase(),
                        style: GoogleFonts.rubik(
                          color: AppColors.filterIcon,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Iconify(
                          Gg.close,
                          color: AppColors.verifyColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.h,
                      bottom: 14.h,
                    ),
                    child: const SheetHeadText(
                      text: 'Suppliers',
                    ),
                  ),
                  const CheckBoxRow(
                    text: 'Restaurants',
                  ),
                  const CheckBoxRow(
                    text: 'Factories',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      bottom: 16.h,
                    ),
                    child: const SheetHeadText(
                      text: 'Categories',
                    ),
                  ),
                  const CategoriesButtons(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      bottom: 16.h,
                    ),
                    child: const Row(
                      children: [
                        SheetHeadText(
                          text: 'Max Distance',
                        ),
                        Spacer(),
                        PostFixText(
                          text: 'km',
                        ),
                      ],
                    ),
                  ),
                  const DistanceSlider(),
                  Row(
                    children: [
                      const SheetHeadText(
                        text: 'Cost',
                      ),
                      const Spacer(),
                      const PostFixText(
                        text: 'Free',
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
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
                  ),
                  CustomCostRangeSlider(
                    isEnabled: !isFree,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const Row(
                    children: [
                      SheetHeadText(
                        text: 'Expiration Proximity',
                      ),
                      Spacer(),
                      PostFixText(
                        text: 'Days left',
                      ),
                    ],
                  ),
                  const CustomDateRangeSlider(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(
                            Size(
                              MediaQuery.of(context).size.width - 48,
                              48.h,
                            ),
                          ),
                          backgroundColor: const WidgetStatePropertyAll(
                            AppColors.primary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          GoRouter.of(context)
                              .push(AppRouter.kSearchResultView);
                        },
                        child: Text(
                          'Apply Filter',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
