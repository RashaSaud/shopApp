import 'package:flutter_application_1/logic/controller/cart_controller.dart';
import 'package:flutter_application_1/logic/controller/category_controller.dart';
import 'package:flutter_application_1/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
