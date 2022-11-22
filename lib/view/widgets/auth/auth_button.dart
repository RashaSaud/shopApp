import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressd;
  const AuthButton({super.key, required this.text, required this.onPressd});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? pinkClr : mainColor,
        minimumSize: Size(360, 50),
      ),
      onPressed: onPressd,
      child: TextUtils(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          text: text,
          color: Colors.white,
          underLine: TextDecoration.none),
    );
  }
}
