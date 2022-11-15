import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:lucky_wheels_flutter/base/show_custom_snackbar.dart';
import 'package:lucky_wheels_flutter/constants/background_grad.dart';
import 'package:lucky_wheels_flutter/constants/colors.dart';
import 'package:lucky_wheels_flutter/constants/custom_values.dart';
import '../../constants/dimensions.dart';

class WheelPage extends StatefulWidget {
  const WheelPage({Key? key}) : super(key: key);

  @override
  WheelPageState createState() => WheelPageState();
}

class WheelPageState extends State<WheelPage> {
  StreamController<int> controller = StreamController<int>();
  int wheelValue = 0;

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const items = CustomValues.WHEEL_ITEMS;

    return Container(
      decoration: BackGroundGradient.background1,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () {
              setState(() {
                wheelValue = Fortune.randomInt(0, items.length);
                debugPrint('fort: ${wheelValue}');
                controller.add(wheelValue);
              });
            },
            child: Column(
              children: [
                Container(
                  height: Dimensions.screenWidth,
                  width: Dimensions.screenWidth,
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
                        showCustomSbackBar('${items[wheelValue]}',
                            isError: false);
                      },
                      items: items.map((element) {
                        return FortuneItem(
                            child: Text('$element'),
                            style: FortuneItemStyle(
                                color: items.indexOf(element) % 2 == 0
                                    ? AppColors.gradient_bg_4
                                    : AppColors.gradient_bg_6,
                                borderColor: AppColors.ligh_purple_1));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
