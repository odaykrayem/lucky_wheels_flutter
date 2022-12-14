// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool isObscure;
  final bool isEmail;
  final bool isNumber;
  final bool isDone;
  final double hintFontSize;

  const AppTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscure = false,
    this.isEmail = false,
    this.isNumber = false,
    this.isDone = false,
    this.hintFontSize = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.height20,
        right: Dimensions.height20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        boxShadow: [
          BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(1, 1),
              color: Colors.grey.withOpacity(0.2)),
        ],
      ),
      child: TextField(
        obscureText: isObscure,
        textInputAction:
            isDone ? TextInputAction.done : TextInputAction.next, //By me
        controller: textController,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isNumber
                ? TextInputType.number
                : TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: hintFontSize == 0 ? Dimensions.font22 : hintFontSize),
          prefixIcon: Icon(
            icon,
            color: AppColors.ligh_purple_1,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.radius15,
            ),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.radius15,
            ),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.radius15,
            ),
          ),
        ),
      ),
    );
  }
}
