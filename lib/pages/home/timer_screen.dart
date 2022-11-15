import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/background_grad.dart';
import 'package:lucky_wheels_flutter/constants/dimensions.dart';
import 'package:lucky_wheels_flutter/widgets/blurred_card.dart';
import 'package:lucky_wheels_flutter/widgets/card_background.dart';
import 'package:lucky_wheels_flutter/widgets/custom_button_1.dart';
import 'package:lucky_wheels_flutter/base/custom_loader.dart';
import '../../constants/custom_values.dart';
import '../../constants/prefs_constants.dart';
import '../../routes/route_helper.dart';
import '../../utils/cacheHelper.dart';
import '../../utils/duration_formatter.dart';
import '../../widgets/huge_text.dart';
import '../../widgets/custom_progress_indicator.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final service = FlutterBackgroundService();

  @override
  void initState() {
    if (CacheHelper.sharedPreferences.containsKey(PrefsConstants.TIMER_ON)) {
      if (CacheHelper.sharedPreferences.getBool(PrefsConstants.TIMER_ON)!) {
        FlutterBackgroundService().startService();
        FlutterBackgroundService().invoke("setAsForeground");
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    service.invoke("stopService");
  }

  @override
  Widget build(BuildContext context) {
    Duration duration = const Duration();
    return Container(
      height: Dimensions.screenHeight,
      decoration: BackGroundGradient.background1,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // CardBackground(height: Dimensions.height30 * 3),
              Container(
                height: Dimensions.height30 + Dimensions.height15,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 + Dimensions.width15,
                  vertical: Dimensions.height10 / 2,
                ),
                child: HugeText(text: 'Here goes news'),
              ),
              const SizedBox(
                height: 20,
              ),
              CardBackground(
                height: Dimensions.height30 * 13,
                marginH: Dimensions.width20 + Dimensions.width15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StreamBuilder<Map<String, dynamic>?>(
                      stream: FlutterBackgroundService().on('update'),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CustomProgressIndicator(
                            centerText: "00:00:00",
                            percent: 0,
                          );
                        }
                        final data = snapshot.data!;
                        int? currentTime = data["current_time"];
                        duration = Duration(seconds: currentTime ?? 0);
                        int currentStep =
                            CustomValues.TIMER - (currentTime ?? 0);
                        return Center(
                            child: CustomProgressIndicator(
                          percent:
                              (currentStep * 100 / CustomValues.TIMER) / 100,
                          centerText:
                              DurationFormatter.durationToTime(duration),
                        ));
                      },
                    ),
                    // ElevatedButton(
                    //   child: const Text("stop"),
                    //   onPressed: () {
                    //     service.invoke("stopService");
                    //   },
                    // ),
                    CustomButton1(
                      borderRadius: 20,
                      width: Dimensions.width45 * 8,
                      height: Dimensions.height30 * 3,
                      text: "spin",
                      fontSize: 30,
                      icon: Icons.speed_outlined,
                      iconSize: 40,
                      onPressed: () {
                        // FlutterBackgroundService().startService();
                        // FlutterBackgroundService().invoke("setAsForeground");
                        Get.toNamed(RouteHelper.getWheelPage());
                      },
                    ),
                  ],
                ),
              ),
              BlurredCard(
                cardHeight: Dimensions.height60,
                marginH: Dimensions.width20 + Dimensions.width15,
                marginV: Dimensions.height20,
                width: 50,
                height: 50,
                child: Text('fff'),
                borderRadius: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
