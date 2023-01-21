import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class CustomButton2 extends StatelessWidget {
  final double borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Color textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color iconColor;
  final double iconSize;
  final String text;
  final IconData? icon;
  final LinearGradient? linearGradient;
  final Color btnColor;

  const CustomButton2({
    Key? key,
    required this.onPressed,
    this.borderRadius = 35,
    this.width,
    this.height = 44.0,
    this.textColor = Colors.black,
    this.fontSize = 25,
    this.fontWeight,
    this.iconColor = Colors.white,
    this.iconSize = 25,
    required this.text,
    this.icon,
    this.linearGradient,
    this.btnColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: icon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: fontWeight ?? FontWeight.w400,
              ),
            ),
            // const SizedBox(
            //   width: 20,
            // ),
            icon == null
                ? const SizedBox(
                    width: 5,
                  )
                : Icon(icon, size: iconSize, color: iconColor)
          ],
        ),
      ),
    );
  }
}
