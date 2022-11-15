import 'package:flutter/material.dart';
import 'package:lucky_wheels_flutter/constants/colors.dart';

class BackGroundGradient {
  static BoxDecoration background1 = BoxDecoration(
    gradient: LinearGradient(
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
        ]),
  );
}
