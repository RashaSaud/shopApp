import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorge = GetStorage();
  final key = 'isDarkModes';
  saveThemeDataInbox(bool isDark) {
    boxStorge.write(key, isDark);
  }

  bool getThemeDataFromBox() {
    return boxStorge.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInbox(!getThemeDataFromBox());
  }
}
