import 'package:flutter_application_1/view/screens/category_screen.dart';
import 'package:flutter_application_1/view/screens/favorites_screen.dart';
import 'package:flutter_application_1/view/screens/home_screen.dart';
import 'package:flutter_application_1/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;
  final title = [
    'Asroo Shop',
    'Categories',
    'Favorite',
    'Settings'
  ].obs;
}
