import 'package:go_router/go_router.dart';
import 'package:insaf/features/Home/presentation/views/home_view.dart';
import 'package:insaf/features/auth%20views/presentation/views/charity/create_account.dart';
import 'package:insaf/features/auth%20views/presentation/views/login_view.dart';
import 'package:insaf/features/auth%20views/presentation/views/new_password_view.dart';
import 'package:insaf/features/auth%20views/presentation/views/reset_password.dart';
import 'package:insaf/features/auth%20views/presentation/views/reset_verify_email.dart';
import 'package:insaf/features/auth%20views/presentation/views/seller/create_account_seller.dart';
import 'package:insaf/features/auth%20views/presentation/views/welcome_view.dart';
import 'package:insaf/features/cart/presentation/view/cart_view.dart';
import 'package:insaf/features/entry%20views/presentation/views/onboarding.dart';
import 'package:insaf/features/entry%20views/presentation/views/splash_view.dart';
import 'package:insaf/features/main/presentation/view/main_view.dart';
import 'package:insaf/features/payment/presentation/views/add_card_view.dart';
import 'package:insaf/features/payment/presentation/views/checkout_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/delete_account_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/edit_profile_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/help_center_view.dart';
import 'package:insaf/features/profile%20views/presentation/views/privacy_policy_view.dart';
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
  static const kMainView = '/kMainView';
  static const kHomeView = '/HomeView';
  static const kSearchView = '/SearchView';
  static const kSearchResultView = '/SearchResultView';
  static const kProfileView = '/ProfileView';
  static const kEditProfileView = '/EditProfileView';
  static const kSettingsView = '/kSettingsView';
  static const kNotificationSettingsView = '/kNotificationSettingsView';
  static const kPasswordManagerView = '/kPasswordManagerView';
  static const kDeleteAccountView = '/kDeleteAccountView';
  static const kPrivacyPolicyView = '/kPrivacyPolicyView';
  static const kHelpCenterView = '/kHelpCenterView';
  static const kCartView = '/kCartView';
  static const kCheckoutView = '/kCheckoutView';
  static const kAddCardView = '/kAddCardView';
  static const kResetPasswordView = '/kResetPasswordView';
  static const kResetVerifyEmailView = '/kResetVerifyEmailView';
  static const kNewPasswordView = '/kNewPasswordView';
  static const kCategoryView = '/kCategoryView';

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
        path: kMainView,
        builder: (context, state) => const MainView(),
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
      GoRoute(
        path: kPrivacyPolicyView,
        builder: (context, state) => const PrivacyPolicyView(),
      ),
      GoRoute(
        path: kHelpCenterView,
        builder: (context, state) => const HelpCenterView(),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: kCheckoutView,
        builder: (context, state) => const CheckoutView(),
      ),
      GoRoute(
        path: kAddCardView,
        builder: (context, state) => const AddCardView(),
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kResetVerifyEmailView,
        builder: (context, state) => const ResetVerifyEmailView(),
      ),
      GoRoute(
        path: kNewPasswordView,
        builder: (context, state) => const NewPasswordView(),
      ),
    ],
  );
}
