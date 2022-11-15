import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/pages/auth/sign_in_page.dart';
import 'package:lucky_wheels_flutter/pages/auth/sign_up_page.dart';
import 'package:lucky_wheels_flutter/pages/home/wheel_page.dart';
import 'package:lucky_wheels_flutter/pages/splash/splash_page.dart';

import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String wheelPage = "/wheel-page";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";
  static const String addAddress = "/add-address";
  static const String pickAddressMap = "/pick-address";

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getWheelPage() => wheelPage;

  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';
  static String getSignUpPage() => '$signUp';
  static String getAddAddressPage() => '$addAddress';
  static String getpickAddAddressPage() => '$pickAddressMap';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(
        name: initial,
        page: () => const HomePage(),
        transition: Transition.fade),
    GetPage(
        name: wheelPage,
        page: () {
          return const WheelPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signIn,
        page: () {
          return const SignInPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signUp,
        page: () {
          return const SignUpPage();
        },
        transition: Transition.leftToRightWithFade),
    //     GetPage(
    // name: popularFood,
    // page: () {
    //   var pageId = Get.parameters['pageId'];
    //   var page = Get.parameters['page'];
    //   return PopularFoodDetail(
    //     pageId: int.parse(pageId!),
    //     page: page!,
    //   );
    // },
    // transition: Transition.fadeIn),
  ];
}
