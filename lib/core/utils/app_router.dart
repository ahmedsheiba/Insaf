import 'package:go_router/go_router.dart';
import 'package:insaf/features/Home/presentation/views/home_view.dart';
import 'package:insaf/features/auth%20views/presentation/views/charity/create_account.dart';
import 'package:insaf/features/auth%20views/presentation/views/login_view.dart';
import 'package:insaf/features/auth%20views/presentation/views/seller/create_account_seller.dart';
import 'package:insaf/features/auth%20views/presentation/views/welcome_view.dart';
import 'package:insaf/features/broduct%20details/presentation/views/broduct_details.dart';
import 'package:insaf/features/entry%20views/presentation/views/onboarding.dart';
import 'package:insaf/features/entry%20views/presentation/views/splash_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/delete_account_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/edit_profile_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/password_manager_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/profile_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/settings_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/notification_settings_view.dart';
import 'package:insaf/features/search%20view/presentation/views/search_result_view.dart';
import 'package:insaf/features/search%20view/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/OnBoardingView';
  static const kWelcomeView = '/WelcomeView';
  static const kLoginView = '/LoginView';
  static const kCharityCreateAccountView = '/CharityCreateAccountView';
  static const kSellerCreateAccountView = '/SellerCreateAccountView';
  static const kHomeView = '/HomeView';
  static const kSearchView = '/SearchView';
  static const kSearchResultView = '/SearchResultView';
  static const kProfileView = '/ProfileView';
  static const kProductDetailsView = '/ProductDetailsView';
  static const kEditProfileView = '/EditProfileView';
  static const kSettingsView = '/kSettingsView';
  static const kNotificationSettingsView = '/kNotificationSettingsView';
  static const kPasswordManagerView = '/kPasswordManagerView';
  static const kDeleteAccountView = '/kDeleteAccountView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: kWelcomeView,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kCharityCreateAccountView,
        builder: (context, state) => const CharityCreateAccountView(),
      ),
      GoRoute(
        path: kSellerCreateAccountView,
        builder: (context, state) => const SellerCreateAccountView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kSearchResultView,
        builder: (context, state) => const SearchResultView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => const ProductDetailsView(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kSettingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: kNotificationSettingsView,
        builder: (context, state) => const NotificationSettingsView(),
      ),
      GoRoute(
        path: kPasswordManagerView,
        builder: (context, state) => const PasswordManagerView(),
      ),
      GoRoute(
        path: kDeleteAccountView,
        builder: (context, state) => const DeleteAccountView(),
      ),
    ],
  );
}
