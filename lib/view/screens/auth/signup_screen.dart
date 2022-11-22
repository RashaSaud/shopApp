import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/utils/my_string.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_from_field.dart';
import '../../widgets/auth/countainer_under.dart';
import 'check_widget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final controller = Get.find<AuthController>();
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
                          text: 'SIGN',
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          underLine: TextDecoration.none),
                      const SizedBox(
                        width: 3,
                      ),
                      TextUtils(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          text: 'UP',
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          underLine: TextDecoration.none)
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFromField(
                    hintText: 'User Name',
                    suffixIcon: const Text(''),
                    prefixIcon: Get.isDarkMode
                        ? const Icon(
                            Icons.person,
                            color: pinkClr,
                            size: 30,
                          )
                        : Image.asset('assets/images/user.png'),
                    controller: nameController,
                    obscureText: false,
                    validator: (value) {
                      if (value.toString().length <= 2 ||
                          !RegExp(validationName).hasMatch(value)) {
                        return "Enter valid name";
                      } else {
                        return null;
                      }
                    },
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
                  GetBuilder<AuthController>(builder: (_) {
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
                  }),

                  const SizedBox(
                    height: 50,
                  ),


                    
                    
                  CheckWidget(),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        text: "SIGN UP",
                        onPressd: () {
                          if (controller.isCheckBox == false) {
                            Get.snackbar('Check Box',
                                'Please ,Accept terms & conditions ',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white);
                          } else if (fromKey.currentState!.validate()) {
                            String name = nameController.text.trim();
                            String image = imageController.text;
                            String email = emailController.text.trim();
                            String password = passwordController.text;

                            controller.signUpUsingFirebase(
                                name: name,
                                email: email,
                                password: password);
                            controller.isCheckBox = true;
                          }
                          ;
                        });
                  })
                ]),
              ),
            ),
          ),
          CountainerUnder(
            text: 'Already have an Account? ',
            textType: 'Log in',
            onPressed: () {
              Get.offAllNamed(Routes.loginScreen);
            },
          ),
        ]),
      ),
    ));
  }
}
