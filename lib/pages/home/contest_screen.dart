import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/background_grad.dart';
import 'package:lucky_wheels_flutter/controllers/contest_controller.dart';
import 'package:lucky_wheels_flutter/models/contest_model.dart';
import 'package:lucky_wheels_flutter/widgets/blurred_card.dart';
import 'package:lucky_wheels_flutter/widgets/card_background.dart';
import 'package:lucky_wheels_flutter/widgets/custom_button_2.dart';
import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../constants/colors.dart';
import '../../constants/custom_values.dart';
import '../../constants/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/glass_container.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({Key? key}) : super(key: key);

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  Future<void> _loadResources() async {
    //when we call Getx controller before GetMaterialApp they generally stay in the memory
    //but here we call them after
    Get.find<ContestController>().getContestList();
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

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<ContestController>(builder: (contestController) {
        return _userLoggedIn
            ? (contestController.isLoaded
                ? RefreshIndicator(
                    onRefresh: () async {
                      _loadResources();
                    },
                    child: ListView.builder(
                        itemCount: contestController.contestList.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return item(
                              context,
                              contestController.contestList[index],
                              contestController);
                        })),
                  )
                : const CustomLoader())
            : Center(
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
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/signintocontinue.png'),
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
    );
  }

  Widget item(BuildContext context, ContestModel contestModel,
      ContestController contestController) {
    return BlurredCard(
      height: Dimensions.height60 * 3.5,
      marginV: Dimensions.height10,
      paddingH: 0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: CardBackground(
                height: Dimensions.height60 * 3.5,
                marginH: 0,
                marginV: 0,
                linearGradient: BackGroundGradient.backgroundlight,
                child: Center(
                  child: GlassContainer(
                    height: Dimensions.height60 * 1.8,
                    width: Dimensions.height60 * 1.8,
                    borderRadius: 360,
                    child: Center(
                      child: AppIcon(
                        image: 'assets/image/contest_3.png',
                        size: Dimensions.height45 * 1.6,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          contestModel.description ?? '',
                          style: const TextStyle(
                              color: Colors.white, overflow: TextOverflow.fade),
                        ),
                      ),
                      contestController.isPLoading
                          ? const CustomLoader()
                          : !contestModel.isParticipant
                              ? CustomButton2(
                                  onPressed: () {
                                    contestController
                                        .participateContest(contestModel.id)
                                        .then((status) {
                                      if (status.isSuccess) {
                                        showCustomSnackBar(status.message,
                                            isError: false);
                                      } else {
                                        showCustomSnackBar(status.message);
                                      }
                                    });
                                  },
                                  text: 'participate'.tr,
                                  fontSize: Dimensions.font24,
                                  textColor:
                                      AppColors.gradient_bg_6.withOpacity(0.7),
                                  width: Dimensions.width45 * 8,
                                  height: Dimensions.height45,
                                )
                              : const SizedBox.shrink()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
