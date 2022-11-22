import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? Image.asset('assets/images/check.png')
                        : Icon(
                            Icons.done,
                            color: pinkClr,
                            size: 30,
                          )
                    : Container()),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'i accept',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: ' terms & conditions',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.underline)
            ],
          )
        ],
      );
    });
  }
}
