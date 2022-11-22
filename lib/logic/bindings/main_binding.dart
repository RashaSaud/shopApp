import 'package:flutter_application_1/logic/controller/main_controller.dart';
import 'package:flutter_application_1/logic/controller/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
        Get.put(SettingController());

  }
}
