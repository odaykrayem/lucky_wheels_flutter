import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

//we calculate the factor TestScreenHeight/itemHeight
//TestScreen 844 *

  static double pageView = screenHeight / 2.64; //320
  static double pageViewContainer = screenHeight / 3.84; //220
  static double pageViewTextContainer = screenHeight / 7.03; //120

  //dynamic haight padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height25 = screenHeight / 33.76;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  //by me
  static double height60 = screenHeight / 14.06;

  //dynamic width padding and margin
  static double width10 = screenWidth / 84.4;
  static double width15 = screenWidth / 56.27;
  static double width20 = screenWidth / 42.2;
  static double width25 = screenWidth / 33.76;
  static double width30 = screenWidth / 28.13;
  static double width45 = screenWidth / 18.76;

  //font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font22 = screenHeight / 38.36;
  static double font24 = screenHeight / 35.16;
  static double font26 = screenHeight / 32.46;

  //radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //icon size
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.17;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //popular food
  static double popularFoodImgSize = screenHeight / 2.41;

  //bottom navigation height
  static double bottomHeightBar = screenHeight / 7.03;

  //Splash screen dimeensions
  static double splashImg = screenHeight / 3.38;
}
