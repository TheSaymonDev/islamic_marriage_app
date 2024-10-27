import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/about_us_screen/about_us_screen.dart';
import 'package:islamic_marriage/screens/address_view_screen/address_view_screen.dart';
import 'package:islamic_marriage/screens/bio_data_details_screen/bio_data_details_screen.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/bindings/bio_data_management_binding.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/bio_data_management_screen.dart';
import 'package:islamic_marriage/screens/cart_screen/cart_screen.dart';
import 'package:islamic_marriage/screens/explore_screens/bindings/explore_binding.dart';
import 'package:islamic_marriage/screens/favourite_bio_data_details_screen/favourite_bio_data_details_screen.dart';
import 'package:islamic_marriage/screens/forget_otp_verification_screen/bindings/forget_otp_verification_binding.dart';
import 'package:islamic_marriage/screens/forget_otp_verification_screen/forget_otp_verification_screen.dart';
import 'package:islamic_marriage/screens/help_center_screen/bindings/help_center_binding.dart';
import 'package:islamic_marriage/screens/help_center_screen/help_center_screen.dart';
import 'package:islamic_marriage/screens/help_mate_screen/bindings/help_mate_binding.dart';
import 'package:islamic_marriage/screens/home_screen/bindings/home_binding.dart';
import 'package:islamic_marriage/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/bindings/identity_verification_binding.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/identity_verification_screen.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/bindings/my_bio_data_binding.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/my_bio_data_screen.dart';
import 'package:islamic_marriage/screens/no_internet_screen/bindings/no_internet_binding.dart';
import 'package:islamic_marriage/screens/no_internet_screen/no_internet_screen.dart';
import 'package:islamic_marriage/screens/onboarding_screen/bindings/onboarding_binding.dart';
import 'package:islamic_marriage/screens/onboarding_screen/onboarding_screen.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/bindings/otp_verification_binding.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:islamic_marriage/screens/plan_screen/plan_screen.dart';
import 'package:islamic_marriage/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:islamic_marriage/screens/profile_update_screen/bindings/profile_update_binding.dart';
import 'package:islamic_marriage/screens/profile_update_screen/profile_update_screen.dart';
import 'package:islamic_marriage/screens/set_password_screen/bindings/set_password_binding.dart';
import 'package:islamic_marriage/screens/set_password_screen/set_password_screen.dart';
import 'package:islamic_marriage/screens/sign_in_screen/bindings/sign_in_binding.dart';
import 'package:islamic_marriage/screens/sign_in_screen/sign_in_screen.dart';
import 'package:islamic_marriage/screens/sign_up_screen/bindings/sign_up_binding.dart';
import 'package:islamic_marriage/screens/sign_up_screen/sign_up_screen.dart';
import 'package:islamic_marriage/screens/wishlist_screen/bindings/wishlist_binding.dart';
import 'package:islamic_marriage/screens/wishlist_screen/wishlist_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.onboardingScreen,
        page: () => OnboardingScreen(),
        binding: OnboardingBinding()),
    GetPage(
        name: AppRoutes.signInScreen,
        page: () => SignInScreen(),
        binding: SignInBinding()),
    GetPage(
        name: AppRoutes.signUpScreen,
        page: () => SignUpScreen(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRoutes.identityVerificationScreen,
        page: () => IdentityVerificationScreen(),
        binding: IdentityVerificationBinding()),
    GetPage(
        name: AppRoutes.otpVerificationScreen,
        page: () => OtpVerificationScreen(),
        binding: OtpVerificationBinding()),
    GetPage(
        name: AppRoutes.forgetOtpVerificationScreen,
        page: () => ForgetOtpVerificationScreen(),
        binding: ForgetOtpVerificationBinding()),
    GetPage(
        name: AppRoutes.setPasswordScreen,
        page: () => SetPasswordScreen(),
        binding: SetPasswordBinding()),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
        WishlistBinding(),
        ExploreBinding(),
        HelpMateBinding()
      ],
    ),
    GetPage(
        name: AppRoutes.myBioDataScreen,
        page: () => MyBioDataScreen(),
        binding: MyBioDataBinding()),
    GetPage(
        name: AppRoutes.bioDataManagementScreen,
        page: () => BioDataManagementScreen(),
        binding: BioDataManagementBinding()),
    GetPage(
        name: AppRoutes.profileUpdateScreen,
        page: () => ProfileUpdateScreen(),
        binding: ProfileUpdateBinding()),
    GetPage(name: AppRoutes.planScreen, page: () => PlanScreen()),
    GetPage(
      name: AppRoutes.addressViewScreen,
      page: () => AddressViewScreen(),
    ),
    GetPage(
      name: AppRoutes.cartScreen,
      page: () => CartScreen(),
    ),
    GetPage(
        name: AppRoutes.helpCenterScreen,
        page: () => HelpCenterScreen(),
        binding: HelpCenterBinding()),
    GetPage(
      name: AppRoutes.privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
    ),
    GetPage(
      name: AppRoutes.aboutUsScreen,
      page: () => AboutUsScreen(),
    ),
    GetPage(
        name: AppRoutes.bioDataDetailsScreen,
        page: () => BioDataDetailsScreen()),
    GetPage(name: AppRoutes.wishlistScreen, page: () => WishlistScreen()),
    GetPage(
        name: AppRoutes.favouriteBioDataDetailsScreen,
        page: () => FavouriteBioDataDetailsScreen()),
    GetPage(
        name: AppRoutes.noInternetScreen,
        page: () => NoInternetScreen(),
        binding: NoInternetBinding())
  ];
}
