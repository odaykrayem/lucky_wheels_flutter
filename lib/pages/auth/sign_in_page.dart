import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../constants/background_grad.dart';
import '../../constants/colors.dart';
import '../../constants/custom_values.dart';
import '../../constants/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();

    void _login(AuthController authController) {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (phone.isEmpty) {
        showCustomSbackBar('typeInYourPhone'.tr, title: 'phone'.tr);
      } else if (password.isEmpty) {
        showCustomSbackBar('typeInYourPassword'.tr, title: 'password'.tr);
      } else if (password.length < 6) {
        showCustomSbackBar('passwordcanNotBeLessThanSixCharacters'.tr,
            title: 'invalidPassword'.tr);
      } else {
        authController.login(phone, password).then((status) {
          if (status.isSuccess) {
            // showCustomSbackBar('success login 11');
            Get.offAllNamed(RouteHelper.getInitial());
          } else {
            showCustomSbackBar(status.message);
          }
        });
      }
    }

    return Container(
      decoration: BoxDecoration(gradient: BackGroundGradient.background1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //App logo
                      CustomValues.registerAndLogInIconNotName
                          ? SizedBox(
                              height: Dimensions.screenHeight * 0.25,
                              child: const Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 80,
                                  backgroundImage: AssetImage(
                                      'assets/image/logo part 1.png'),
                                ),
                              ),
                            )
                          : Center(
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
                                  backgroundImage: AssetImage(
                                      'assets/image/logo part 1.png'),
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
                        height: Dimensions.height45,
                      ),
                      //weloem section
                      Container(
                        margin: EdgeInsets.only(
                          // left: Dimensions.width20,//origin
                          left: Dimensions.width30 + Dimensions.width10,
                          right:
                              Dimensions.width30 + Dimensions.width10, //By Me
                        ),
                        width: double.maxFinite,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'hello'.tr,
                                style: TextStyle(
                                    fontSize: Dimensions.font20 * 3 +
                                        Dimensions.font20 / 2,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'signIntoYourAccount'.tr,
                                style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //phone
                      AppTextField(
                        textController: phoneController,
                        hintText: 'phone'.tr, //TODO
                        icon: Icons.phone,
                        isEmail: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //password
                      AppTextField(
                        textController: passwordController,
                        hintText: 'password'.tr,
                        icon: Icons.password_sharp,
                        isObscure: true,
                        isDone: true,
                      ),

                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //tag line
                      // Container(
                      //   //By Me
                      //   margin: EdgeInsets.symmetric(
                      //       horizontal: Dimensions.height20),
                      //   child: Row(
                      //     children: [
                      //       Expanded(child: Container()),
                      //       RichText(
                      //         text: TextSpan(
                      //           recognizer: TapGestureRecognizer()
                      //             ..onTap = () => Get.back(),
                      //           text: 'signIntoYourAccount'.tr,
                      //           style: TextStyle(
                      //             color: Colors.grey[500],
                      //             fontSize: Dimensions.font20,
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: Dimensions.width20,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //signin button
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: 'signIn'.tr,
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ), //TODO
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'dontHaveAnAccount'.tr,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(RouteHelper
                                    .getSignUpPage()), //TODO: Routing
                              text: ' ${'create'.tr}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        }),
      ),
    );
  }
}
