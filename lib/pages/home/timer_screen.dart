import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/background_grad.dart';
import 'package:lucky_wheels_flutter/constants/dimensions.dart';
import 'package:lucky_wheels_flutter/widgets/app_icon.dart';
import 'package:lucky_wheels_flutter/widgets/big_text.dart';
import 'package:lucky_wheels_flutter/widgets/blurred_card.dart';
import 'package:lucky_wheels_flutter/widgets/blurred_texticon_widget.dart';
import 'package:lucky_wheels_flutter/widgets/card_background.dart';
import 'package:lucky_wheels_flutter/widgets/custom_button_1.dart';
import 'package:lucky_wheels_flutter/base/custom_loader.dart';
import 'package:lucky_wheels_flutter/widgets/glass_container.dart';
import '../../constants/colors.dart';
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
      decoration: BoxDecoration(gradient: BackGroundGradient.background1),
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
              GlassContainer(
                height: Dimensions.height30 * 13,
                marginH: Dimensions.width20 + Dimensions.width15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StreamBuilder<Map<String, dynamic>?>(
                      stream: FlutterBackgroundService().on('update'),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CustomProgressIndicator(
                            centerText: "00:00:00",
                            percent: 0,
                            fontSize: Dimensions.font16 * 2.5,
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
                          fontSize: Dimensions.font16 * 2.5,
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
                      height: Dimensions.height30 * 2.5,
                      text: 'spin'.tr,
                      textColor: AppColors.mainColor,
                      fontSize: Dimensions.font16 * 2.5,
                      icon: Icons.speed_outlined,
                      iconSize: Dimensions.iconSize16 * 2.5,
                      iconColor: AppColors.mainColor,
                      linearGradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            AppColors.gradient_purple_1.withOpacity(0.5),
                            AppColors.gradient_purple_2.withOpacity(0.5),
                            AppColors.gradient_purple_3.withOpacity(0.5),
                            AppColors.gradient_purple_4.withOpacity(0.5),
                            AppColors.gradient_purple_5.withOpacity(0.5),
                            AppColors.gradient_purple_6.withOpacity(0.5),
                          ]),
                      onPressed: () {
                        // FlutterBackgroundService().startService();
                        // FlutterBackgroundService().invoke("setAsForeground");
                        Get.toNamed(RouteHelper.getWheelPage());
                      },
                    ),
                  ],
                ),
              ),
              GlassContainer(
                height: Dimensions.height60,
                marginH: Dimensions.width20 + Dimensions.width15,
                marginV: Dimensions.height15,
                borderRadius: 50,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'getMorePoints'.tr,
                          style: TextStyle(
                              // color: Colors.white.withOpacity(0.8),
                              color: AppColors.gradient_purple_6,
                              fontSize: Dimensions.font16 * 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                        CustomButton1(
                          onPressed: () {},
                          height: Dimensions.height45,
                          width: Dimensions.width30 * 6,
                          text: '${'extra'.tr}\$',
                          fontSize: Dimensions.font24,
                          linearGradient: BackGroundGradient.backgroundBtn1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              BlurredCard(
                height: Dimensions.height60 * 2.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: 'referralsList'.tr,
                          color: Colors.white,
                        ),
                        BigText(
                          text: 'inviteYourFriendsToJoinTheAppAndWinMorePoints'
                              .tr,
                          maxLines: 2,
                          color: Colors.white,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                    GlassContainer(
                      height: Dimensions.height60 * 1.8,
                      width: Dimensions.height60 * 1.8,
                      borderRadius: 360,
                      child: Center(
                        child: AppIcon(
                          image: 'assets/image/referrals_img.png',
                          size: Dimensions.height60 * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlurredCard(
                height: Dimensions.height60 * 2.5,
                marginV: Dimensions.height15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: 'referralsList'.tr,
                          color: Colors.white,
                        ),
                        BigText(
                          text: 'inviteYourFriendsToJoinTheAppAndWinMorePoints'
                              .tr,
                          maxLines: 2,
                          color: Colors.white,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                    GlassContainer(
                      height: Dimensions.height60 * 1.8,
                      width: Dimensions.height60 * 1.8,
                      borderRadius: 360,
                      child: Center(
                        child: AppIcon(
                          image: 'assets/image/share_img.png',
                          size: Dimensions.height60 * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height25 * 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
