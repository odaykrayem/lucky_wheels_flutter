import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/base/showWithdrawalDialog.dart';
import 'package:lucky_wheels_flutter/base/show_custom_snackbar.dart';
import 'package:lucky_wheels_flutter/widgets/blurred_texticon_widget.dart';
import 'package:lucky_wheels_flutter/widgets/glass_container.dart';
import 'package:lucky_wheels_flutter/widgets/huge_text.dart';
import '../../base/custom_loader.dart';
import '../../constants/colors.dart';
import '../../constants/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../routes/route_helper.dart';
import '../../base/showTransferPointsDialog.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      debugPrint('accpage: user has looged in');
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      // resizeToAvoidBottomInset: true,
      body: GetBuilder<UserController>(builder: (userController) {
        return _userLoggedIn
            ? (!userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      top: Dimensions.height20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlassContainer(
                          height: Dimensions.height15 * 16,
                          width: Dimensions.height15 * 16,
                          borderRadius: 360,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HugeText(text: 'balance'.tr),
                              SizedBox(height: Dimensions.height20),
                              HugeText(
                                  text: '${userController.userModel!.balance}',
                                  size: Dimensions.font26),
                            ],
                          )),
                        ),
                        SizedBox(
                          height: Dimensions.height20 * 2,
                        ),
                        GlassContainer(
                          height: Dimensions.height15 * 5,
                          width: Dimensions.width45 * 13,
                          borderRadius: 45,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HugeText(text: 'points'.tr),
                              HugeText(
                                  text: '${userController.userModel!.points}',
                                  size: Dimensions.font26),
                            ],
                          )),
                        ),
                        SizedBox(
                          height: Dimensions.height20 * 3,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                BlurredTextIconWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.currency_exchange_rounded,
                                      backgroundColor:
                                          AppColors.gradient_purple_3,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height30,
                                      size: Dimensions.height10 * 6,
                                    ),
                                    bigText: BigText(
                                      text: 'transferPointsToBalance'.tr,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    onPressed: () async {
                                      await userController.getMinPoints();
                                      int minPoints = userController.minPoints;
                                      if (userController.userModel!.points <
                                          minPoints) {
                                        showCustomSnackBar(
                                            '${'youDontHaveEnoughPoints'.tr}${'theMinimumPointsIs'.tr}${userController.minPoints}');
                                      } else {
                                        showTransferPointsDialog(context);
                                      }
                                    }),
                                SizedBox(
                                  height: Dimensions.height30,
                                ),
                                BlurredTextIconWidget(
                                    appIcon: AppIcon(
                                      image: 'assets/image/payeer.png',
                                      imageHeight: Dimensions.height45,
                                      imageWidth: Dimensions.width45,
                                      backgroundColor:
                                          AppColors.gradient_purple_3,
                                      size: Dimensions.height10 * 6,
                                    ),
                                    bigText: BigText(
                                      text: 'withdrawBalance'.tr,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    onPressed: () async {
                                      await userController.getMinBalance();
                                      double minBalance =
                                          userController.minBalance;
                                      if (userController.userModel!.balance <
                                          minBalance) {
                                        showCustomSnackBar(
                                            '${'youDontHaveEnoughBlance'.tr}${'theMinimumBalanceIs'.tr}${userController.minBalance}');
                                      } else {
                                        showWithdrawalDialog(context);
                                      }
                                    }),
                                SizedBox(
                                  height: Dimensions.height30,
                                ),
                                BlurredTextIconWidget(
                                    appIcon: AppIcon(
                                      image: 'assets/image/withdrawals_img.png',
                                      imageHeight: Dimensions.height45,
                                      imageWidth: Dimensions.width45,
                                      backgroundColor:
                                          AppColors.gradient_purple_3,
                                      size: Dimensions.height10 * 6,
                                    ),
                                    bigText: BigText(
                                      text: 'withdrawlsList'.tr,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    onPressed: () {})
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
