import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(      padding: EdgeInsets.only(left: 15, top: 15),
              child: TextUtils(
                
                fontSize: 30, fontWeight: FontWeight.bold
                
              , text: 'Category', color: Get.isDarkMode? Colors.white:Colors.black, underLine: TextDecoration.none),
     ),
            ),
            const SizedBox(height: 20,),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
