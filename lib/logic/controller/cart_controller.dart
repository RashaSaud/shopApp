import 'package:flutter_application_1/model/product_models.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
      //       Get.snackbar(
      //   'Error!',
      //   '${productsMap[productModels]}',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.green,
      //   colorText: Colors.white,
      // );
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllproductes() {
    Get.defaultDialog(
        title: 'delete all item',
        titleStyle: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        middleText: 'are you sure you need to clear the cart?',
        middleTextStyle: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: 'cancel',
        cancelTextColor: Colors.white,
        textConfirm: 'Yes',
        confirmTextColor: Colors.white,
        onConfirm: () {
          productsMap.clear();
          Get.back();
        },
        onCancel: () {
          Get.toNamed(Routes.cartScreen);
        },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor);
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
