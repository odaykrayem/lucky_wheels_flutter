import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:lucky_wheels_flutter/constants/background_grad.dart';
import 'package:lucky_wheels_flutter/constants/custom_values.dart';
import 'package:lucky_wheels_flutter/widgets/phone_text_field.dart';
import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../constants/colors.dart';
import '../../constants/dimensions.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var regRefCodeController = TextEditingController();
    FocusNode phoneNode = FocusNode();
    String? countryCode;
    String? code;
    Country newCountry =
        countries.firstWhere((element) => element.code == 'SA');
    var signUpImages = [
      't.png',
      'f.png',
      'g.png',
    ];

    phoneNode.addListener(() {
      setState(() {});
    });
    void _registration(AuthController authController) {
      debugPrint(phoneController.text);
      debugPrint(countryCode);
      String firstName = firstNameController.text.trim();
      String lastName = lastNameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String regRefCode = regRefCodeController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      RegExp emailReg = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

      if (firstName.isEmpty) {
        showCustomSbackBar('typeInYourFirstName'.tr, title: 'name'.tr);
      } else if (firstName.length < 3) {
        showCustomSbackBar('firstNameMustBeThree'.tr,
            title: 'invalidFirstName'.tr);
      } else if (lastName.isEmpty) {
        showCustomSbackBar('typeInYourLastNumber'.tr, title: 'name'.tr);
      } else if (lastName.length < 3) {
        showCustomSbackBar('lastNameMustBeThree'.tr,
            title: 'invalidLastName'.tr);
      } else if (phone.isEmpty) {
        showCustomSbackBar('typeInYourPhoneNumber'.tr, title: 'phoneNumber'.tr);
      } else if (phone.length < 9) {
        showCustomSbackBar('phoneNumberMustBeNine'.tr,
            title: 'invalidPhoneNumber'.tr);
      } else if (email.isEmpty) {
        showCustomSbackBar('typeInYourEmail'.tr, title: 'email'.tr);
      } else if (!emailReg.hasMatch(email.trim())) {
        showCustomSbackBar("${'emailMustBeLike'.tr} example@something.com",
            title: 'invalidEmail'.tr);
      } else if (password.isEmpty) {
        showCustomSbackBar('typeInYourPassword'.tr, title: 'password'.tr);
      } else if (password.length < 6) {
        showCustomSbackBar('passwordcanNotBeLessThanSixCharacters'.tr,
            title: 'invalidPassword'.tr);
      } else if (confirmPassword.isEmpty) {
        showCustomSbackBar('typeInPasswordConfirmation'.tr,
            title: 'password'.tr);
      } else if (password != confirmPassword) {
        showCustomSbackBar('PasswordAndPasswordConfirmationAreNotTheSame'.tr,
            title: 'password'.tr);
      } else {
        // showCustomSbackBar('perfect'.tr, title: 'perfect'.tr);
        // SignUpBody signUpBody = SignUpBody(
        //   name: name,
        //   phone: phone,
        //   email: email,
        //   password: password,
        // );
        // authController.registration(signUpBody).then((status) {
        //   if (status.isSuccess) {
        //     debugPrint('success registeration');
        //     Get.offNamed(RouteHelper.getInitial());
        //   } else {
        //     showCustomSbackBar(status.message);
        //   }
        // });
        // debugPrint(signUpBody.toString());
      }
    }

    return Container(
      decoration: BackGroundGradient.background1,
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
                        height: Dimensions.height20,
                      ),
                      //name
                      Row(
                        children: [
                          Expanded(
                            child: AppTextField(
                              textController: firstNameController,
                              hintText: 'firstName'.tr,
                              icon: Icons.person,
                              hintFontSize: Dimensions.font20,
                            ),
                          ),
                          Expanded(
                            child: AppTextField(
                              textController: lastNameController,
                              hintText: 'lastName'.tr,
                              icon: Icons.person_pin_rounded,
                              hintFontSize: Dimensions.font20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                        textController: emailController,
                        hintText: 'email'.tr,
                        icon: Icons.email,
                        hintFontSize: Dimensions.font20,
                        isEmail: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //phone
                      PhoneTextField(
                          controller: phoneController,
                          node: phoneNode,
                          onChanged: (phone) {
                            countryCode = phone.countryCode;
                            debugPrint(phone.completeNumber);
                          },
                          onSaved: (phone) {
                            countryCode = phone?.countryCode;
                          },
                          onCountryChanged: (Country? country) {
                            countryCode = "+${country?.dialCode}";
                            newCountry = country!;
                          }),

                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //password
                      AppTextField(
                        textController: passwordController,
                        hintText: 'password'.tr,
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //phone
                      AppTextField(
                        textController: confirmPasswordController,
                        hintText: 'confirmPassword'.tr,
                        icon: Icons.password_rounded,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                        textController: regRefCodeController,
                        hintText: '${'refCode'.tr} (${'optional'.tr})',
                        icon: Icons.code_rounded,
                        isDone: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20 + Dimensions.height20,
                      ),
                      //signup button
                      GestureDetector(
                        onTap: () {
                          _registration(authController);
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
                              text: 'signUp'.tr,
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        // height: Dimensions.height10,
                        height: Dimensions.height20,
                      ),
                      //tag line
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: 'haveAnAccountAlready'.tr,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //signup options
                      RichText(
                        text: TextSpan(
                          text: 'signUpUsingOneOfTheFollowningMethods'.tr,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16,
                          ),
                        ),
                      ),
                      Wrap(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: Dimensions.radius30,
                              backgroundImage: AssetImage(
                                  'assets/image/${signUpImages[index]}'),
                            ),
                          ),
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
