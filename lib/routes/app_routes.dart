import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/order/widgets/order.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:t_store/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => HomeScreen()),
    GetPage(name: TRoutes.store, page: () => StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => SignupScreen()),
    GetPage(name: TRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgotPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
