import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../widgets/setting/dark_mode_widget.dart';
import '../widgets/setting/language_widget.dart';
import '../widgets/setting/log_out_widget.dart';
import '../widgets/setting/profile_widget.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,

      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
         ProfileWidget(),
         const SizedBox(height: 10,),
         Divider(color: Get.isDarkMode? Colors.white:Colors.grey,
         thickness: 2,),
         const SizedBox(height: 20,),
         TextUtils(fontSize: 18, fontWeight: FontWeight.bold, 
         text: 'GENERAL'.tr, color: Get.isDarkMode?pinkClr :mainColor, 
         underLine: TextDecoration.none),
         const SizedBox(height: 20,),
        DarkModeWidget(),
       const SizedBox(height: 20,),
      LanguageWidget(),
   const SizedBox(height: 20,),
  LogOutWidget(),



        ],
      ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       TextButton(
        //         onPressed: () {
        //           ThemeController().changesTheme();
        //         },
        //         child: Text(
        //           'Dark Mode',
        //           style: TextStyle(
        //               color: Get.isDarkMode ? Colors.white : Colors.black),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       TextButton(
        //         onPressed: () {},
        //         child: GetBuilder<AuthController>(
        //           builder: (controller) {
        //             return TextButton(
        //                 onPressed: () {
                        
        //                 },
        //                 child: Text(
        //                   'LogOut',
        //                   style: TextStyle(
        //                       color:
        //                           Get.isDarkMode ? Colors.white : Colors.black),
        //                 ));
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // )
        
        );
  }
}
