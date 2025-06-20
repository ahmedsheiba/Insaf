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
  int selectedFaqCategory = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          toolbarHeight: 115.h,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 16.h),
                const BackAndTitleAppBar(title: 'Help Center'),
                SizedBox(height: 18.h),
                TabBar(
                  padding: EdgeInsets.zero,
                  tabs: const [
                    Tab(text: "FAQ"),
                    Tab(text: "Contact us"),
                  ],
                  labelStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
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
        body: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: TabBarView(
              children: [
                // FAQ Tab
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
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
                            SizedBox(height: 20.h), // Extra padding at bottom
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // Contact Us Tab
                const Center(
                  child: Text('Contact Us Content'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
