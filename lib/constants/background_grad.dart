import 'package:flutter/material.dart';
import 'package:lucky_wheels_flutter/constants/colors.dart';

class BackGroundGradient {
  static LinearGradient background1 = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.gradient_bg_1,
        AppColors.gradient_bg_2,
        AppColors.gradient_bg_3,
        AppColors.gradient_bg_4,
        AppColors.gradient_bg_5,
        AppColors.gradient_bg_6,
        AppColors.gradient_bg_7,
      ]);
  static LinearGradient background2 = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        AppColors.gradient_purple_1,
        AppColors.gradient_purple_2,
        AppColors.gradient_purple_3,
        AppColors.gradient_purple_4,
        AppColors.gradient_purple_5,
        AppColors.gradient_purple_6,
      ]);

  static LinearGradient backgroundBtn1 = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        AppColors.gradient_btn_10,
        AppColors.gradient_btn_11,
        AppColors.gradient_btn_12,
        AppColors.gradient_btn_13,
      ]);
}
