import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/colors.dart';
import 'package:lucky_wheels_flutter/constants/dimensions.dart';
import 'package:lucky_wheels_flutter/controllers/user_controller.dart';
import 'package:lucky_wheels_flutter/widgets/blurred_card.dart';
import 'package:lucky_wheels_flutter/widgets/custom_button_2.dart';
import 'package:lucky_wheels_flutter/widgets/huge_text.dart';

import 'custom_loader.dart';
import 'show_custom_snackbar.dart';
import '../widgets/app_icon.dart';
import '../widgets/glass_container.dart';

void showTransferPointsDialog(BuildContext context) {
  // showDialog(context: context, builder: (context) => Alert);
  Get.find<UserController>().getMinPoints();
  var userPoints = Get.find<UserController>().userModel!.points;

  Get.defaultDialog(
    radius: Dimensions.radius30,
    contentPadding: EdgeInsets.zero,
    title: 'transferPointsToBalance'.tr,
    titleStyle: TextStyle(color: Colors.white),
    backgroundColor: AppColors.gradient_bg_6.withOpacity(0.7),
    content: Container(
      width: Dimensions.width45 * 14,
      margin:
          EdgeInsets.symmetric(horizontal: 0, vertical: Dimensions.height20),
      child: GetBuilder<UserController>(builder: (userController) {
        return Column(
          children: [
            BlurredCard(
                height: Dimensions.height60 * 1.8,
                width: Dimensions.width45 * 6,
                child: HugeText(
                  text: !userController.isDataLoaded
                      ? '\$'
                      : '${userController.pointsToTransfer}',
                )),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        userController.increaseTransferPoints(5);
                        debugPrint(
                            'wallet: ${userController.pointsToTransfer}');
                      },
                      child: GlassContainer(
                        height: Dimensions.height60 * 1.8,
                        width: Dimensions.height60 * 1.8,
                        borderRadius: 360,
                        child: Center(
                          child: AppIcon(
                              image: 'assets/image/increase.png',
                              size: Dimensions.height60 * 1.5,
                              backgroundColor: Colors.transparent),
                        ),
                      ),
                    )),
                const Expanded(flex: 1, child: SizedBox()),
                Expanded(
                    flex: 2,
                    child: InkWell(
                        onTap: () {
                          userController.decreaseTransferPoints(5);
                          debugPrint(
                              'wallet: ${userController.pointsToTransfer}');
                        },
                        child: GlassContainer(
                          height: Dimensions.height60 * 1.8,
                          width: Dimensions.height60 * 1.8,
                          borderRadius: 360,
                          child: Center(
                            child: AppIcon(
                                image: 'assets/image/decrease.png',
                                size: Dimensions.height60 * 1.5,
                                backgroundColor: Colors.transparent),
                          ),
                        )))
              ],
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
            userController.isLoadingTransfer
                ? const CustomLoader()
                : CustomButton2(
                    onPressed: () {
                      userController.transferPoints().then((status) {
                        if (status.isSuccess) {
                          Get.back();
                          showCustomSnackBar(status.message, isError: false);
                        } else {
                          showCustomSnackBar(status.message);
                        }
                      });
                    },
                    height: Dimensions.height60,
                    width: Dimensions.width45 * 7,
                    text: 'transfer'.tr,
                    textColor: AppColors.gradient_bg_6.withOpacity(0.7),
                  )
          ],
        );
      }),
    ),
    barrierDismissible: true,
  );
}
