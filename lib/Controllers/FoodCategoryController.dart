import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/MenuCategoryModel.dart';

class FoodCategoryController extends GetxController {
  List<MenuCategoryModel> menu = List<MenuCategoryModel>.empty().obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<List<MenuCategoryModel>> FetchMenuCategory(context) async {
    final assetBundle = DefaultAssetBundle.of(context);

    final data = await assetBundle.loadString('jsonData/MenuCategory.json');

    final body = json.decode(data) as List;

    return body.map((e) => MenuCategoryModel.fromJson(e)).toList();
  }
  // FetchMenuCategory() async {
  //   List<MenuCategoryModel> CategoryData = [
  //    MenuCategoryModel(
  //      menuid: "01",
  //      menuName: "Snacks",
  //      url:
  //          "https://i.pinimg.com/736x/7c/47/44/7c4744fa2d6e36bb69657845d7eb9b11.jpg"),
  //   MenuCategoryModel(
  //      menuid: "02",
  //      menuName: "Breverages",
  //      url:
  //          "https://i.pinimg.com/736x/7c/47/44/7c4744fa2d6e36bb69657845d7eb9b11.jpg"),
  //  ];

  //  menu.assignAll(CategoryData);

  //  update();
  // }
}
