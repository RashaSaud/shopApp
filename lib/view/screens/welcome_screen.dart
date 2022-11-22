import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../widgets/text_utils.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: TextUtils(
                    underLine: TextDecoration.none,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    text: 'Welcom',
                    color: Colors.white,
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const TextUtils(
                          underLine: TextDecoration.none,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: 'Asroo',
                          color: mainColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const TextUtils(
                          underLine: TextDecoration.none,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: 'Shop',
                          color: Colors.white,
                        )
                      ],
                    )),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                      text: 'Get Start',
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const TextUtils(
                        underLine: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: "don't have an account?",
                        color: Colors.white),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signupScreen);
                        },
                        child: TextUtils(
                          text: 'sign up',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          underLine: TextDecoration.underline,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
