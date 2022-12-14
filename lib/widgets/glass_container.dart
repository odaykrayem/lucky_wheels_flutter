import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lucky_wheels_flutter/constants/dimensions.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer(
      {Key? key,
      required this.height,
      this.borderRadius = 0,
      this.marginH = 0,
      required this.child,
      this.marginV = 0,
      this.width})
      : super(key: key);

  final double height;
  final double? width;
  final double borderRadius;
  final double marginH;
  final double marginV;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width ?? Dimensions.screenWidth,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: marginH, vertical: marginV),
      borderRadius: borderRadius == 0
          ? Dimensions.radius20 + Dimensions.radius15
          : borderRadius,
      blur: 100,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.03),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFFFFFF).withOpacity(0.1),
          const Color((0xFFFFFFFF)).withOpacity(0.1),
        ],
      ),
      child: child,
    );
  }
}
