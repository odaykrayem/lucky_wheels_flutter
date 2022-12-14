import 'package:flutter/material.dart';

import '../constants/dimensions.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  final int? maxLines;

  const BigText(
      {Key? key,
      // this.color = const Color(0xFF332d2b),
      this.color = const Color(0xbbffffff),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0,
      this.fontWeight = FontWeight.w400,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
      ),
    );
  }
}
