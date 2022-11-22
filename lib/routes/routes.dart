// ignore_for_file: constant_identifier_names

import 'package:flutter_application_1/logic/controller/product_controller.dart';
import 'package:flutter_application_1/view/screens/cart_screen.dart';
import 'package:flutter_application_1/view/screens/main_screen.dart';
import 'package:get/get.dart';

import '../logic/bindings/auth_binding.dart';
import '../logic/bindings/main_binding.dart';
import '../logic/bindings/product_binding.dart';
import '../view/screens/auth/forget_password.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/signup_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const welcomeScreen(),
    ),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signupScreen,
        page: () => SignupScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.ForgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [AuthBinding(), MainBinding(), ProductBinding()],
    ),
      GetPage(
        name: Routes.cartScreen,
        page: () => CartScreen(),
    
              bindings: [AuthBinding(), ProductBinding()],

        ),
    
  ];
}

class Routes {
  static const welcomeScreen = '/welcomescreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const ForgotPasswordScreen = '/ForgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
