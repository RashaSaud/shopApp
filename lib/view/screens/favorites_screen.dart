import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/product_controller.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favoritestList.isEmpty)
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/heart.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please add your favorites products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
              ),
            ]),
          );
        else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                    image: controller.favoritestList[index].image,
                    price: controller.favoritestList[index].price,
                    title: controller.favoritestList[index].title,
                    id: controller.favoritestList[index].id);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favoritestList.length);
        }
      }),
    );
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required int id,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(children: [
          SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ $price',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                controller.manageFavorites(id);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ))
        ]),
      ),
    );
  }
}
