import 'package:flutter/material.dart';
import 'package:insaf/features/Home/presentation/views/widgets/categories_grid.dart';
import 'package:insaf/features/Home/presentation/views/widgets/custom_appbar.dart';
import 'package:insaf/features/Home/presentation/views/widgets/offer_widget.dart';
import 'package:insaf/features/Home/presentation/views/widgets/suggested_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            const OfferWidget(),
            CategoriesSection(),
            SuggestedSection(),
          ],
        ),
      ),
    );
  }
}
