import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class BlurredCard extends StatelessWidget {
  const BlurredCard({
    Key? key,
    this.borderRadius = 0,
    required this.child,
    this.background,
    this.width,
    required this.height,
    this.marginH = 0,
    this.marginV = 0,
    this.paddingH,
    this.paddingV,
  }) : super(key: key);

  final double? width;
  final double height;
  final double marginH;
  final double marginV;
  final double borderRadius;
  final Widget child;
  final Color? background;
  final double? paddingH;
  final double? paddingV;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background ?? AppColors.gradient_purple_3.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius == 0
            ? Dimensions.radius20 + Dimensions.radius15
            : borderRadius),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: marginH == 0 ? Dimensions.width30 : marginH,
          vertical: marginV),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius == 0
                  ? Dimensions.radius20 + Dimensions.radius15
                  : borderRadius),
              // <-- clips to the 200x200 [Container] below
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: paddingH ?? Dimensions.width20,
                      vertical: paddingV ?? 0),
                  width: width,
                  height: height,
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
