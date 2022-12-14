// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData? icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  final String? image;
  final double? imageWidth;
  final double? imageHeight;

  const AppIcon({
    Key? key,
    this.icon = Icons.abc,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size = 40,
    this.iconSize = 16,
    this.image,
    this.imageWidth,
    this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: image != null
          ? Image.asset(
              image!,
              width: imageWidth ?? size,
              height: imageHeight ?? size,
            )
          : Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
    );
  }
}
