import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/colors.dart';
import 'package:lucky_wheels_flutter/constants/custom_values.dart';

import '../constants/dimensions.dart';
import '../widgets/big_text.dart';

void showCustomSbackBar(String message,
    {bool isError = true, String title = CustomValues.APP_NAME}) {
  //titleText and mesasgeText are customization
  Get.snackbar(title, message,
      titleText: BigText(
        text: title,
        color: isError ? Colors.red : Colors.white,
        size: Dimensions.font22,
        fontWeight: FontWeight.w700,
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      barBlur: 30
      // backgroundColor: isError ? Colors.redAccent : AppColors.mainColor,
      );
}
