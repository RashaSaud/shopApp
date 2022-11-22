import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class SearchFromText extends StatelessWidget {
  final controller = Get.find<ProductController>();
  SearchFromText({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (_) => TextField(
          
            controller: controller.searchTextController,
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            onChanged: (searchName) {
              controller.addSearchToList(searchName);
            },
            style: TextStyle(color: Get.isDarkMode? Colors.black :Colors.black),
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.red,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon:controller.searchTextController.text.isNotEmpty ? 
                
                 IconButton(
                    onPressed: () {
                      controller.clearSearch();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    )) :null,
                hintText: "search  with name & price",
                hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ))));
  }
}
