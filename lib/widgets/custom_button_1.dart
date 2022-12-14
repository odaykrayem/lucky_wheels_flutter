import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class CustomButton1 extends StatelessWidget {
  final double borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Color textColor;
  final double fontSize;
  final Color iconColor;
  final double iconSize;
  final String text;
  final IconData? icon;
  final LinearGradient? linearGradient;

  const CustomButton1({
    Key? key,
    required this.onPressed,
    this.borderRadius = 35,
    this.width,
    this.height = 44.0,
    this.textColor = Colors.white,
    this.fontSize = 25,
    this.iconColor = Colors.white,
    this.iconSize = 25,
    required this.text,
    this.icon,
    this.linearGradient,
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
          gradient: linearGradient ??
              LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    AppColors.gradient_btn_1,
                    AppColors.gradient_btn_2,
                    AppColors.gradient_btn_3,
                    AppColors.gradient_btn_4,
                    AppColors.gradient_btn_5,
                    AppColors.gradient_btn_6,
                  ]),
        ),
        child: Row(
          mainAxisAlignment: icon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: fontSize, color: textColor),
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
