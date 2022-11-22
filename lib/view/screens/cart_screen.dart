import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controller/cart_controller.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:get/get.dart';

import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: const Text('Cart Items'),
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.clearAllproductes();
                  },
                  icon: const Icon(Icons.backspace))
            ],
          ),
          body: Obx(
            () {
              if (controller.productsMap.isEmpty) {
                return EmptyCart();
              } else {return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductcard(
                              quantity:
                                  controller.productsMap.values.toList()[index],
                              index: index,
                              productModels:
                                  controller.productsMap.keys.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: controller.productsMap.length),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    )
                  ],
                ),
              );}
              
            },
          )),
    );
  }
}
