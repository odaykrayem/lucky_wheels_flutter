import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../constants/colors.dart';
import '../../constants/custom_values.dart';
import '../../constants/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      debugPrint('accpage: user has looged in');
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<UserController>(builder: (userController) {
        return !_userLoggedIn
            ? (!userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      top: Dimensions.height20,
                    ),
                    child: Column(
                      children: [
                        //Profile Icon
                        // AppIcon(
                        //   icon: Icons.person,
                        //   backgroundColor: AppColors.mainColor,
                        //   iconColor: Colors.white,
                        //   // iconSize: Dimensions.height45 + Dimensions.height30,
                        //   // size: Dimensions.height15 * 10,
                        //   //By Me
                        //   iconSize: Dimensions.height15 * 6,
                        //   size: Dimensions.height15 * 11,
                        // ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              CustomValues.APP_NAME.split(' ')[0],
                              style: TextStyle(
                                  color: AppColors.gradient_purple_5,
                                  fontSize: Dimensions.font26 * 3,
                                  fontFamily: "Devonshire"),
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage:
                                  AssetImage('assets/image/logo part 1.png'),
                            ),
                            Text(
                              CustomValues.APP_NAME.split(' ')[1],
                              style: TextStyle(
                                  color: AppColors.gradient_purple_5,
                                  fontSize: Dimensions.font26 * 3,
                                  fontFamily: "Devonshire"),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: Dimensions.height20 * 4,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                //name
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.badge_outlined,
                                    backgroundColor: AppColors.mainColor,
                                    iconColor: Colors.white,
                                    // iconSize: Dimensions.height25,
                                    iconSize: Dimensions.height30,
                                    // size: Dimensions.height10 * 5,
                                    size: Dimensions.height10 * 6,
                                  ),
                                  bigText: BigText(
                                    text: 'User Name',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //Phone
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.phone,
                                    backgroundColor: AppColors.gradient_btn_5,
                                    iconColor: Colors.white,
                                    // iconSize: Dimensions.height25,
                                    iconSize: Dimensions.height30,
                                    // size: Dimensions.height10 * 5,
                                    size: Dimensions.height10 * 6,
                                  ),
                                  bigText: BigText(
                                    text: '00963435453',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //email
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.code_rounded,
                                    backgroundColor: AppColors.gradient_btn_5,
                                    iconColor: Colors.white,
                                    // iconSize: Dimensions.height25,
                                    iconSize: Dimensions.height30,
                                    // size: Dimensions.height10 * 5,
                                    size: Dimensions.height10 * 6,
                                  ),
                                  bigText: BigText(
                                    // text: 'userController.userModel!.phone',
                                    text: 'kjdmbshdhwhvdyaydvsdk',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),

                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //Messages
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.collections_bookmark_rounded,
                                    backgroundColor:
                                        AppColors.gradient_purple_3,
                                    iconColor: Colors.white,
                                    // iconSize: Dimensions.height25,
                                    iconSize: Dimensions.height30,
                                    // size: Dimensions.height10 * 5,
                                    size: Dimensions.height10 * 6,
                                  ),
                                  bigText: BigText(
                                    // text: 'messages'.tr,
                                    text: 'refTimes: '.tr + '10',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //Messages 2
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearSharedData();
                                      Get.offNamed(RouteHelper.getSignInPage());
                                    } else {
                                      Get.offNamed(RouteHelper.getSignInPage());
                                    }
                                  },
                                  child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.logout,
                                      backgroundColor: AppColors.gradient_bg_2,
                                      iconColor: Colors.white,
                                      // iconSize: Dimensions.height25,
                                      iconSize: Dimensions.height30,
                                      // size: Dimensions.height10 * 5,
                                      size: Dimensions.height10 * 6,
                                    ),
                                    bigText: BigText(
                                      text: 'logout'.tr,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const CustomLoader())
            : Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      // height: Dimensions.height20 * 8,
                      height: Dimensions.height20 * 10,
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/image/signintocontinue.png'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getSignInPage());
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 5,
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Center(
                          child: BigText(
                            text: 'signIn'.tr,
                            color: Colors.white,
                            size: Dimensions.font26,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              );
      }),
    );
  }
}
