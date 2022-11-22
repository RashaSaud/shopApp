import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CountainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const CountainerUnder(
      {required this.text,
      required this.onPressed,
      required this.textType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? pinkClr : mainColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: text,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: textType,
                  color: Colors.white,
                  underLine: TextDecoration.none))
        ],
      ),
    );
  }
}
