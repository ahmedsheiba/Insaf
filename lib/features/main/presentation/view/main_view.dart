import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/presentation/views/home_view.dart';
import 'package:insaf/features/cart/presentation/view/cart_view.dart';
import 'package:insaf/features/notification/presentation/views/notification_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  // Create a separate widget for your home content
  final List<Widget> _pages = [
    const HomeView(),
    const CartView(),
    const NotificationView(),
    const ProfileView(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Iconify(
              Teenyicons.home_outline,
              color: _currentIndex == 0
                  ? AppColors.editPenColor
                  : AppColors.verifyColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              Bi.cart,
              color: _currentIndex == 1
                  ? AppColors.editPenColor
                  : AppColors.verifyColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              Bi.bell,
              color: _currentIndex == 2
                  ? AppColors.editPenColor
                  : AppColors.verifyColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              Bi.person,
              color: _currentIndex == 3
                  ? AppColors.editPenColor
                  : AppColors.verifyColor,
            ),
            label: '',
          ),
        ],
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.editPenColor, // Add your primary color
        unselectedItemColor: Colors.grey, // Add unselected color
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
