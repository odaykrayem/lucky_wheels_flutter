// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lucky_wheels_flutter/widgets/blurred_card.dart';

import '../constants/dimensions.dart';
import 'app_icon.dart';
import 'big_text.dart';

class BlurredTextIconWidget extends StatelessWidget {
  Widget appIcon;
  BigText bigText;
  double? height;
  VoidCallback onPressed;
  Widget? addChild;

  BlurredTextIconWidget({
    Key? key,
    required this.appIcon,
    required this.bigText,
    this.height,
    required this.onPressed,
    this.addChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: BlurredCard(
        height: height ?? Dimensions.height30 + Dimensions.height30,
        child: Row(
          children: [
            appIcon,
            SizedBox(
              width: Dimensions.width20,
            ),
            bigText,
            addChild ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
