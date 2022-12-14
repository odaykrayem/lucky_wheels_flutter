// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lucky_wheels_flutter/widgets/blurred_card.dart';
import '../constants/dimensions.dart';
import 'app_icon.dart';
import 'big_text.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  double? height;

  AccountWidget({
    Key? key,
    required this.appIcon,
    required this.bigText,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurredCard(
      height: height ?? Dimensions.height30 + Dimensions.height30,
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimensions.width20,
          ),
          bigText,
        ],
      ),
    );
  }
}
