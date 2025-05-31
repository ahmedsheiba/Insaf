import 'package:flutter/material.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              color: AppColors.arrowLeft,
            ),
            Icon(
              Icons.shopping_cart,
              color: AppColors.grey,
            ),
            Icon(
              Icons.notifications,
              color: AppColors.grey,
            ),
            Icon(
              Icons.person,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
