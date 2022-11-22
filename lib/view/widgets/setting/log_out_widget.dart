import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                      title: 'Log out',
                      titleStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      middleText: 'are you sure you need to log out?',
                      middleTextStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      backgroundColor: Colors.grey,
                      radius: 10,
                      textCancel: 'cancel',
                      cancelTextColor: Colors.white,
                      textConfirm: 'log out',
                      confirmTextColor: Colors.white,
                      onConfirm: () {
                        controller.signOutFromApp();
                      },
                      onCancel: () {
                        Get.back();
                      },
                      buttonColor: Get.isDarkMode ? pinkClr : mainColor);
                },
                splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
                borderRadius: BorderRadius.circular(12),
                customBorder: const StadiumBorder(),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: logOutSettings,
                    ),
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      text: 'Logout'.tr,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none),
                ]),
              ),
            ));
  }
}
