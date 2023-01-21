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

  static LinearGradient backgroundlight = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        AppColors.light_purple_2.withOpacity(0.7),
        AppColors.light_purple_1.withOpacity(0.7),
        AppColors.gradient_purple_6.withOpacity(0.7),
        AppColors.gradient_purple_5.withOpacity(0.7),
        AppColors.gradient_purple_4.withOpacity(0.7),
        AppColors.gradient_purple_3.withOpacity(0.7),
      ]);

  static LinearGradient backgroundlightBlue = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        AppColors.gradient_blue_1.withOpacity(0.7),
        AppColors.gradient_blue_2.withOpacity(0.7),
        AppColors.gradient_blue_4.withOpacity(0.7),
      ]);

  static LinearGradient backgroundlightPurple = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        AppColors.background_purple_1.withOpacity(0.7),
        AppColors.background_purple_2.withOpacity(0.7),
        AppColors.background_purple_3.withOpacity(0.5),
        // AppColors.background_purple_4.withOpacity(0.7),
        // AppColors.background_purple_5,
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
