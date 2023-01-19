import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/dimensions.dart';

class CardBackground extends StatelessWidget {
  const CardBackground({
    Key? key,
    this.borderRadius = 0,
    this.marginH,
    this.marginV,
    required this.height,
    this.width,
    this.child,
    this.linearGradient,
  }) : super(key: key);

  final double height;
  final double? width;
  final double borderRadius;
  final double? marginH;
  final double? marginV;
  final Widget? child;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(
            horizontal: marginH ?? Dimensions.width30,
            vertical: marginV ?? Dimensions.height30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius == 0
              ? Dimensions.radius20 + Dimensions.radius15
              : borderRadius)),
          gradient: linearGradient ??
              LinearGradient(
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
