// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode node;
  final Function(PhoneNumber)? onChanged;
  final void Function(PhoneNumber?)? onSaved;
  final void Function(Country)? onCountryChanged;

  const PhoneTextField({
    Key? key,
    required this.controller,
    required this.node,
    required this.onChanged,
    required this.onSaved,
    required this.onCountryChanged,
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
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntlPhoneField(
          controller: controller,
          // validator: (value) {
          //   if (value!.number.isEmpty) {
          //     return 'empty';
          //   }
          //   if (value.number.trim().length < 9) {
          //     return 'Phone Number must be 9 digits';
          //   }
          //   return null;
          // },
          cursorColor: node.hasFocus ? AppColors.mainColor : Colors.grey,
          cursorWidth: 1.0,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
          flagsButtonMargin: const EdgeInsets.symmetric(horizontal: 10.0),
          disableLengthCheck: true,
          showDropdownIcon: false,
          pickerDialogStyle: PickerDialogStyle(
              searchFieldCursorColor: AppColors.mainColor,
              searchFieldInputDecoration: InputDecoration(
                hintText: 'searchCountry'.tr,
                hintStyle: const TextStyle(
                  height: 0.0,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.mainColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: AppColors.mainColor,
                  ),
                ),
              )),
          decoration: InputDecoration(
            hintText: "phone".tr,
            hintStyle: TextStyle(fontSize: Dimensions.font22),
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

          initialCountryCode: 'SY',
          onChanged: onChanged,
          onSaved: onSaved,
          onCountryChanged: onCountryChanged,
        ),
      ),
    );
  }
}
