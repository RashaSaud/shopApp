import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controller/settings_controller.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../../../logic/controller/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});

  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
              activeTrackColor: Get.isDarkMode? pinkClr:mainColor,
              activeColor: Get.isDarkMode? pinkClr:mainColor,
              value: controller.switchValue.value,
              onChanged: (value) {
                ThemeController().changesTheme();
                controller.switchValue.value = value;
              },
            )
          ],
        ));
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings,
          ),
          child: const Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: 'Dark Mode'.tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none),
      ]),
    );
  }
}
