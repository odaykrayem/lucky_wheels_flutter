import 'package:flutter/material.dart';

import '../constants/dimensions.dart';

class HugeText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;

  const HugeText(
      {Key? key,
      this.color = Colors.white,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimensions.font20 * 2 : size,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto'),
    );
  }
}
