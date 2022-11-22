import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_models.dart';
import 'package:flutter_application_1/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoritestList = <ProductModels>[].obs;

  var isLoading = true.obs;

  var storage = GetStorage();

  //search vars
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storedShopping = storage.read<List>("isFavoritesList");
    if (storedShopping != null) {
      favoritestList =
          storedShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //logic for FavScreen

  void manageFavorites(int productId) async {
    var removeProduct =
        favoritestList.indexWhere((element) => element.id == productId);
    if (removeProduct >= 0) {
      favoritestList.removeAt(removeProduct);
      await storage.remove("isFavoritesList");
    } else {
      var add = productList.firstWhere((element) => element.id == productId);
      favoritestList.add(add);
      await storage.write("isFavoritesList", favoritestList);
    }
  }

  bool isFavorites(int productId) {
    return favoritestList.any((element) => element.id == productId);
  }

  //Search Bar Logic
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList('');
  }
}
