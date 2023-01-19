import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/base/custom_loader.dart';
import 'package:lucky_wheels_flutter/base/show_custom_snackbar.dart';
import 'package:lucky_wheels_flutter/constants/background_grad.dart';
import 'package:lucky_wheels_flutter/constants/colors.dart';
import 'package:lucky_wheels_flutter/constants/custom_values.dart';
import 'package:lucky_wheels_flutter/controllers/user_controller.dart';
import 'package:lucky_wheels_flutter/widgets/blurred_card.dart';
import 'package:lucky_wheels_flutter/widgets/glass_container.dart';
import 'package:lucky_wheels_flutter/widgets/huge_text.dart';
import '../../constants/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({Key? key}) : super(key: key);

  @override
  WheelScreenState createState() => WheelScreenState();
}

class WheelScreenState extends State<WheelScreen> {
  StreamController<int> controller = StreamController<int>.broadcast();
  int wheelValue = 0;
  bool isTapped = true;

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const items = CustomValues.WHEEL_ITEMS;

    return Container(
      decoration: BoxDecoration(gradient: BackGroundGradient.background1),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GetBuilder<UserController>(builder: (userController) {
            return GestureDetector(
                onTap: isTapped
                    ? () {
                        setState(() {
                          wheelValue = Fortune.randomInt(0, items.length);
                          controller.add(wheelValue);
                          isTapped = false;
                          userController.setIsLoading(true);
                        });
                      }
                    : () {},
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.height30),
                    userController.isLoading
                        ? const CustomLoader()
                        : !isTapped
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  HugeText(
                                    text: 'youHaveGot'.tr,
                                  ),
                                  HugeText(
                                    text: ' ${items[wheelValue]} ',
                                    color: AppColors.light_purple_2,
                                  ),
                                  HugeText(
                                    text: 'points'.tr,
                                  ),
                                ],
                              )
                            : SizedBox(),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    GlassContainer(
                      height: Dimensions.screenWidth,
                      width: Dimensions.screenWidth,
                      borderRadius: 360,
                      marginH: Dimensions.width10,
                      // marginV: Dimensions.width10,
                      child: Container(
                        height: Dimensions.screenWidth - 20,
                        width: Dimensions.screenWidth - 20,
                        margin: EdgeInsets.all(Dimensions.width20),
                        child: FortuneWheel(
                            selected: controller.stream,
                            animateFirst: false,
                            physics: CircularPanPhysics(
                              duration: const Duration(seconds: 1),
                              curve: Curves.decelerate,
                            ),
                            indicators: [
                              FortuneIndicator(
                                alignment: Alignment
                                    .topCenter, // <-- changing the position of the indicator
                                child: TriangleIndicator(
                                  color: AppColors
                                      .gradient_purple_1, // <-- changing the color of the indicator
                                ),
                              ),
                            ],
                            onFling: () {
                              controller.add(1);
                            },
                            onAnimationEnd: () {
                              // debugPrint('${controller.}')
                              // showCustomSnackBar('${items[wheelValue]}',
                              //     isError: false);
                              userController.wheelPoints(items[wheelValue]);
                            },
                            items: items.map((element) {
                              return FortuneItem(
                                  child: Text('$element'),
                                  style: FortuneItemStyle(
                                      color: items.indexOf(element) % 2 == 0
                                          ? AppColors.gradient_bg_4
                                          : AppColors.gradient_bg_6,
                                      borderColor: AppColors.light_purple_1));
                            }).toList()
                            //  [
                            //   for (var it in items)
                            //     FortuneItem(
                            //         child: Text('$it'),
                            //         style: FortuneItemStyle(
                            //             color: AppColors.gradient_bg_4,
                            //             borderColor: AppColors.ligh_purple_1)),
                            // ],
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: BlurredCard(
                        height: Dimensions.height60 * 2.5,
                        width: Dimensions.width45 * 8,
                        marginV: Dimensions.height15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GlassContainer(
                              height: Dimensions.height45 * 2.5,
                              width: Dimensions.width45 * 6,
                              borderRadius: 360,
                              child: Center(
                                child: AppIcon(
                                  image: 'assets/image/arrow_back.png',
                                  imageHeight: Dimensions.height30,
                                  imageWidth: Dimensions.width45 * 2,
                                  size: Dimensions.height60 * 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }
}
