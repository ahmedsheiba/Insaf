import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/back_and_title_app_bar.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/faq_buttons.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/faq_question_widget.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/text_field_insaf.dart';

class HelpCenterViewBody extends StatefulWidget {
  const HelpCenterViewBody({super.key});

  @override
  State<HelpCenterViewBody> createState() => _HelpCenterViewBodyState();
}

class _HelpCenterViewBodyState extends State<HelpCenterViewBody> {
  int selectedFaqCategory = 0; // Track selected FAQ category

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              right: 24.w,
              left: 24.w,
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                const BackAndTitleAppBar(
                  title: 'Help Center',
                ),
                SizedBox(height: 28.h),
                TabBar(
                  padding: EdgeInsets.zero,
                  tabs: const [
                    Tab(text: "FAQ"),
                    Tab(text: "Contact us"),
                  ],
                  labelStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColors.arrowLeft,
                    letterSpacing: 0.5,
                  ),
                  labelColor: AppColors.editPenColor,
                  unselectedLabelColor: const Color(0xff999999),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: AppColors.editPenColor,
                    ),
                  ),
                  indicatorWeight: 2.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            right: 24.w,
            left: 24.w,
          ),
          child: TabBarView(
            children: [
              // FAQ Tab
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: FAQButtons(
                              text: [
                                "General",
                                "Using the App",
                                "Notifications"
                              ][index],
                              isActive: selectedFaqCategory == index,
                              onPressed: () {
                                setState(() {
                                  selectedFaqCategory = index;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    const TextFieldInsaf(),
                    SizedBox(height: 26.h),
                    const InsafInfoWidget(),
                  ],
                ),
              ),
              // Contact Us Tab
              const Center(
                child: Text('Contact Us Content'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
