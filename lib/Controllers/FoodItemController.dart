import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/CartModel.dart';
import '../Models/MenuItemModel.dart';

class FoodItemController extends GetxController {
  List<CartModel> cartitem = List<CartModel>.empty().obs;
  List<MenuItemModel> menuitemlist = List<MenuItemModel>.empty().obs;
  RxInt itemcount = 0.obs;
  RxDouble grandTotal = 0.0.obs;
  RxDouble taxValue = 0.0.obs;
  RxInt itemTotal = 0.obs;
  RxDouble shippingTotal = 0.0.obs;
  RxDouble couponcharges = 0.0.obs;
  RxString paymentMode = "02".obs;
  Future<List<MenuItemModel>> FetchMenuItem(context, args) async {
    final assetBundle = DefaultAssetBundle.of(context);

    final data = await assetBundle.loadString('jsonData/MenuItem.json');

    final body = json.decode(data) as List;
    print(args.menuName);

    menuitemlist.assignAll(body
        .where((element) => element['menuid'] == args.menuid)
        .map((e) => MenuItemModel.fromJson(e))
        .toList());

    return menuitemlist;
  }

  GetStorage box = GetStorage();

  void increaseQty(MenuItemModel item, String menuName, int qty) {
    // remove the current selected item from the list of cart
    cartitem.removeWhere((itemValue) => itemValue.itemId == item.itemId);

    // increase the total of qty by one
    item.quantity++;

    qty++;
    // adding it back to the list of cart, The Airsoft model that has increased qty
    cartitem.add(CartModel(
        menuid: item.menuid,
        itemId: item.itemId,
        itemName: item.itemName,
        menuName: menuName,
        itemImage: item.image,
        quanity: qty,
        price: item.price));

    List<Map<String, dynamic>> items_cart =
        cartitem.map((e) => e.toJson()).toList();

    // count total quantity

    countAllItems();
    calculateGrandTotal();

    // Write current list cart into session
    box.write('items_cart', items_cart);
  }

  void updatingSession() {
    // Name updateingSession because this process will update the session

    box.listenKey('items_cart', (updatedValue) {
      print("updated value is  $updatedValue");

      // We check if updatedValue is the type of list, that means has value in it
      if (updatedValue is List) {
        // Delete existing datas inside list of cart
        cartitem.clear();
        // Then assign the updated datas from session into the list of cart
        cartitem
            .addAll(updatedValue.map((e) => CartModel.fromJson(e)).toList());
      }
    });
    countAllItems();
    calculateGrandTotal();
  }

  void decreaseQty(MenuItemModel item, String menuName, int qty) {
    print('call decrease quantity function value : $qty');
    if (qty == 1) {
      // remove the selected item from list of cart
      cartitem
          .removeWhere((selectedItem) => selectedItem.itemId == item.itemId);
    } else {
      // remove the selected item from list of cart
      cartitem
          .removeWhere((selectedItem) => selectedItem.itemId == item.itemId);
      // update display quantity value

      item.quantity--;
      // substract qty by 1
      qty--;

      // add again the model with the substracted one qty
      cartitem.add(CartModel(
          menuid: item.menuid,
          itemId: item.itemId,
          itemName: item.itemName,
          menuName: menuName,
          itemImage: item.image,
          quanity: qty,
          price: item.price));
    }

    List<Map<String, dynamic>> items_cart =
        cartitem.map((e) => e.toJson()).toList();

    countAllItems();
    calculateGrandTotal();

    box.write('items_cart', items_cart);
  }

  countAllItems() {
    itemcount.value = 0;

    for (var element in cartitem) {
      itemcount.value += element.quanity;
    }

    print(itemcount.value);
  }

  void calculateGrandTotal() {
    //calculate total item value
    itemTotal.value = 0;
    for (int i = 0; i < cartitem.length; i++) {
      itemTotal = itemTotal + (cartitem[i].quanity * cartitem[i].price);
    }

    //calculating tax  with 5% tax
    taxValue.value = 0;

    taxValue.value = grandTotal.value * (5 / 100);

    //calculating shipping charges
    shippingTotal.value = 0.0;

    //coupon discount value

    couponcharges.value = 0.0;

    // Grand Total

    grandTotal.value = (itemTotal.value - couponcharges.value) +
        shippingTotal.value +
        taxValue.value;
  }

  void removeItemFromCart(CartModel item) {
    cartitem.removeWhere((selectedItem) => selectedItem.itemId == item.itemId);
    List<Map<String, dynamic>> items_cart =
        cartitem.map((e) => e.toJson()).toList();
    countAllItems();
    calculateGrandTotal();

    box.write('items_cart', items_cart);
    updatingSession();
  }

  void decreaseQtyOfItemInCart(CartModel item) {
    if (item.quanity == 1) {
      // remove the selected item from list of cart
      cartitem
          .removeWhere((selectedItem) => selectedItem.itemId == item.itemId);
    } else {
      item.quanity--;
    }

    List<Map<String, dynamic>> items_cart =
        cartitem.map((e) => e.toJson()).toList();

    countAllItems();
    calculateGrandTotal();

    box.write('items_cart', items_cart);
    updatingSession();
  }

  void increaseQtyOfItemInCart(CartModel item) {
    item.quanity++;

    List<Map<String, dynamic>> items_cart =
        cartitem.map((e) => e.toJson()).toList();

    // count total quantity

    countAllItems();
    calculateGrandTotal();

    // Write current list cart into session
    box.write('items_cart', items_cart);

    print(cartitem.first.toJson());
    updatingSession();
  }

  void getUpdatedSessionCartData() {
    // Check if previously user has selected items into the cart?
    if (box.hasData('items_cart')) {
      print('previous cart data');
      List<dynamic> value = GetStorage().read('items_cart');
      if (value is List) {
        List<CartModel> getModelFromSession =
            value.map((e) => CartModel.fromJson(e)).toList();
        cartitem.clear();
        cartitem.addAll(getModelFromSession);
      }
      countAllItems();
      calculateGrandTotal();
      updatingSession();
    } else {
      print('no data found');
    }

    // if previously user haven't selected any items into the cart,
    // Then simply listen for the changes that will happen now
  }

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    // Your code goes here
    getUpdatedSessionCartData();
    super.onInit();
  }
}
