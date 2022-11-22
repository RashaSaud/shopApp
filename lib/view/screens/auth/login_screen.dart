import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_from_field.dart';
import '../../widgets/auth/countainer_under.dart';
import '../../widgets/text_utils.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
      ),
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
              child: Form(
                key: fromKey,
                child: Column(children: [
                  Row(
                    children: [
                      TextUtils(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          text: 'LOG',
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          underLine: TextDecoration.none),
                      const SizedBox(
                        width: 3,
                      ),
                      TextUtils(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          text: 'IN',
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          underLine: TextDecoration.none)
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextFromField(
                    hintText: 'Email',
                    suffixIcon: const Text(''),
                    prefixIcon: Get.isDarkMode
                        ? const Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          )
                        : Image.asset('assets/images/email.png'),
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return "Invalid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthTextFromField(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.visibilty();
                          },
                          icon: controller.isVisibilty
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                        ),
                        prefixIcon: Get.isDarkMode
                            ? const Icon(
                                Icons.lock,
                                size: 30,
                                color: pinkClr,
                              )
                            : Image.asset('assets/images/lock.png'),
                        controller: passwordController,
                        obscureText: controller.isVisibilty ? false : true,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return "password should be longer or equal 6 charachters ! ";
                          } else {
                            return null;
                          }
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.ForgotPasswordScreen);
                        },
                        child: TextUtils(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            text: 'Forgot password?',
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underLine: TextDecoration.none)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      onPressd: () {
                        String email = emailController.text.trim();
                        String password = passwordController.text;

                        if (fromKey.currentState!.validate()) {
                          controller.logInUsingFirebase(
                              email: email, password: password);
                        }
                      },
                      text: "LOG IN",
                    );
                  }),
                  const SizedBox(height: 20),
                  TextUtils(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      text: 'OR',
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<AuthController>(builder: (_) {
                        return InkWell(
                            onTap: () {
                              FacebookAuth.i.webAndDesktopInitialize(
                                appId: "836523987499232",
                                cookie: true,
                                xfbml: true,
                                version: "v9.0",
                              );
                              controller.faceBookSignUpApp();

                              print(controller);
                            },
                            child: Image.asset(
                              'assets/images/facebook.png',
                            ));
                      }),
                      const SizedBox(
                        width: 10,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return InkWell(
                            onTap: () {
                              controller.googleSignUpApp();
                             
                            },
                            child: Image.asset('assets/images/google.png'));
                      })
                    ],
                  )
                ]),
              ),
            ),
          ),
          CountainerUnder(
            text: "Don't have an account? ",
            textType: "Sign up",
            onPressed: () {
              Get.offAllNamed(Routes.signupScreen);
            },
          ),
        ]),
      ),
    ));
  }
}
