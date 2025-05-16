import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/custom_app_bar.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/search_head_text.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              child: CustomAppBar(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 32.h,
                bottom: 18.h,
              ),
              child: const SearchHeadText(
                text: 'Recent Searches',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 32.h,
                bottom: 18.h,
              ),
              child: const SearchHeadText(
                text: 'Recently Used filters',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
