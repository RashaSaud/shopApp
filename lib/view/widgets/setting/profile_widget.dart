import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controller/auth_controller.dart';
import 'package:flutter_application_1/logic/controller/settings_controller.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('ussseeee name ######### ${authController.displayUserName.value}');
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              authController.displayUserPhoto.value),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        text: controller
                            .capitalize(authController.displayUserName.value),
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none),
                    TextUtils(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        text: 'Email:${authController.displayUserEmail.value}',
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none)
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
