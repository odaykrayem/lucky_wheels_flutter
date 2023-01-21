import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/background_grad.dart';
import 'package:lucky_wheels_flutter/controllers/reward_controller.dart';
import 'package:lucky_wheels_flutter/models/reward_model.dart';
import 'package:lucky_wheels_flutter/widgets/card_background.dart';
import 'package:lucky_wheels_flutter/widgets/custom_button_2.dart';
import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../constants/colors.dart';
import '../../constants/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/glass_container.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  Future<void> _loadResources() async {
    try {
      final rewardController = Get.find<RewardController>();

      if (rewardController.initialized) {
        Get.find<RewardController>().getRewardList();
      } else {
        Get.lazyPut(() => RewardController(rewardRepo: Get.find()));
        Get.find<RewardController>().getRewardList();
      }
    } catch (e) {
      Get.lazyPut(() => RewardController(rewardRepo: Get.find()));
      Get.find<RewardController>().getRewardList();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
  }

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    debugPrint('contest :: ${_userLoggedIn}');

    return Container(
      decoration:
          BoxDecoration(gradient: BackGroundGradient.backgroundlightPurple),
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.back();
            },
            child: AppIcon(
              image: 'assets/image/arrow_back.png',
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.only(top: Dimensions.height10),
            child: GetBuilder<RewardController>(builder: (rewardController) {
              return _userLoggedIn
                  ? (rewardController.isLoaded
                      ? RefreshIndicator(
                          onRefresh: () async {
                            _loadResources();
                          },
                          child: GridView.builder(
                            itemCount: rewardController.rewardList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.65,
                                    mainAxisSpacing: Dimensions.height25,
                                    crossAxisSpacing: Dimensions.width25),
                            itemBuilder: ((context, index) {
                              return item(rewardController.rewardList[index],
                                  rewardController);
                            }),
                          ),
                        )
                      : const CustomLoader())
                  : Center(
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
                              image: AssetImage(
                                  'assets/image/signintocontinue.png'),
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
                    ));
            }),
          ),
        ),
      ),
    );
  }

  Widget item(RewardModel rewardModel, RewardController rewardController) {
    return Container(
      padding: EdgeInsets.zero,
      child: CardBackground(
        height: Dimensions.height60 * 5,
        marginH: Dimensions.width15,
        marginV: Dimensions.height10,
        linearGradient: BackGroundGradient.backgroundlightBlue,
        child: GlassContainer(
          height: Dimensions.height60 * 7,
          marginV: 0,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: Dimensions.height60 * 1.8,
                  width: Dimensions.height60 * 2,
                  margin: EdgeInsets.symmetric(vertical: Dimensions.height25),
                  child: Center(
                    child: AppIcon(
                      image: 'assets/image/gift_1.png',
                      backgroundColor: Colors.transparent,
                      size: Dimensions.height45 * 3,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${'getYourRewardEvery'.tr} ${rewardModel.duration} ${'hours'.tr}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                        rewardController.isPLoading
                            ? const CustomLoader()
                            : rewardModel.isOn
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: Dimensions.height10),
                                    child: CustomButton2(
                                      btnColor: Colors.white,
                                      onPressed: () {
                                        rewardController
                                            .reward(rewardModel.id)
                                            .then((status) {
                                          if (status.isSuccess) {
                                            showCustomSnackBar(status.message,
                                                isError: false);
                                          } else {
                                            showCustomSnackBar(status.message);
                                          }
                                        });
                                      },
                                      text: 'getReward'.tr,
                                      fontSize: Dimensions.font24,
                                      fontWeight: FontWeight.bold,
                                      textColor: AppColors.gradient_blue_2
                                          .withOpacity(0.7),
                                      width: Dimensions.width45 * 7,
                                      height: Dimensions.height45 +
                                          Dimensions.height10,
                                    ),
                                  )
                                : SizedBox(
                                    child: AppIcon(
                                      image: 'assets/image/lock.png',
                                      backgroundColor: Colors.transparent,
                                      size: Dimensions.height45 * 2,
                                    ),
                                  )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
