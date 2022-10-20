import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/CartModel.dart';

class CartController extends GetxController {
  List<CartModel> cartitem = List<CartModel>.empty().obs;
  RxInt itemcount = 0.obs;
  RxInt grandTotal = 0.obs;
  RxInt itemTotal = 0.obs;
  GetStorage box = GetStorage();

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

  void calculateGrandTotal() {
    grandTotal.value = 0;
    for (int i = 0; i < cartitem.length; i++) {
      grandTotal = grandTotal + (cartitem[i].quanity * cartitem[i].price);
    }
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

  countAllItems() {
    itemcount.value = 0;

    for (var element in cartitem) {
      itemcount.value += element.quanity;
    }

    print(itemcount.value);
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
  }

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    // Your code goes here
    getUpdatedSessionCartData();
    super.onInit();
  }
}
