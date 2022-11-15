import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/dimensions.dart';

class CardBackground extends StatelessWidget {
  const CardBackground(
      {Key? key,
      this.border = 0,
      this.marginH = 0,
      this.marginV = 0,
      required this.height,
      this.width,
      this.child})
      : super(key: key);

  final double height;
  final double? width;
  final double border;
  final double marginH;
  final double marginV;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(
            horizontal: marginH == 0 ? Dimensions.width30 : marginH,
            vertical: marginV),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(border == 0
              ? Dimensions.radius20 + Dimensions.radius15
              : border)),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                AppColors.gradient_purple_1,
                AppColors.gradient_purple_2,
                AppColors.gradient_purple_3,
                AppColors.gradient_purple_4,
                AppColors.gradient_purple_5,
                AppColors.gradient_purple_6,
              ]),
        ),
        child: child);
  }
}
