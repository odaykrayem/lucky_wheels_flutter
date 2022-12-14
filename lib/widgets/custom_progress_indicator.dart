import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../constants/colors.dart';
import '../constants/dimensions.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator(
      {Key? key,
      required this.percent,
      required this.centerText,
      required this.fontSize,
      this.radius})
      : super(key: key);
  final double percent;
  final String centerText;
  final double? fontSize;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius ?? Dimensions.radius20 * 6,
      lineWidth: 18.0,
      animation: false,
      addAutomaticKeepAlive: false,
      animateFromLastPercent: false,
      animationDuration: 0,
      backgroundColor: AppColors.light_purple_2,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      rotateLinearGradient: true,
      center: Text(
        centerText,
        style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.w600),
      ),
      linearGradient: LinearGradient(colors: [
        AppColors.cyan_1,
        AppColors.light_blue_1,
        AppColors.light_blue_2,
        AppColors.cyan_1
      ]),
    );
  }
}
