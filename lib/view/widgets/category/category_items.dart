import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controller/cart_controller.dart';
import 'package:flutter_application_1/logic/controller/category_controller.dart';
import 'package:flutter_application_1/logic/controller/product_controller.dart';
import 'package:flutter_application_1/model/product_models.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/view/screens/product_details_screen.dart';
import 'package:flutter_application_1/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({super.key,required this.categoryTitle});

  final controller = Get.find<ProductController>();
  final Cartcontroller = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx(() {
        if (categoryController.isAllCategory.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return GridView.builder(
              itemCount: categoryController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6,
                  maxCrossAxisExtent: 200),
              itemBuilder: (context, index) {
                return buildCardItems(
                    image: categoryController.categoryList[index].image,
                    price: categoryController.categoryList[index].price,
                    rate: categoryController.categoryList[index].rating.rate,
                    productId: categoryController.categoryList[index].id,
                    productModels: categoryController.categoryList[index],
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(
                            productModels:
                                categoryController.categoryList[index],
                          ));
                    });
              });
        }
      }),
    );
  }

  Widget buildCardItems(
      {required String image,
      required double price,
      required double rate,
      required int productId,
      required Function() onTap,
      required ProductModels productModels}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ]),
          child: Column(children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            )),
                  IconButton(
                      onPressed: () {
                        Cartcontroller.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${price}',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            // ignore: prefer_const_literals_to_create_immutables
                            [
                          TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: '$rate',
                              color: Colors.white,
                              underLine: TextDecoration.none),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 13,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
