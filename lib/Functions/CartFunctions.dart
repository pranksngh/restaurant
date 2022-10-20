import 'package:restaurant/Models/CartModel.dart';
import '../Models/MenuItemModel.dart';

class CartFunctions {
  List<CartModel> cartitem = [];

  AddToCart(MenuItemModel menuitem, String menuName) {
    //check if the data is already exist in cartitem list or not

    int isExist =
        cartitem.where((element) => element.itemId == menuitem.itemId).length;

    if (isExist == 0) {
      //menu item does not exist in the cart, Now we'll add the item to the cart
      print('is exist value is $isExist');

      cartitem.add(CartModel(
          menuid: menuitem.menuid,
          itemId: menuitem.itemId,
          itemName: menuitem.itemName,
          menuName: menuName,
          itemImage: menuitem.image,
          quanity: menuitem.quantity,
          price: menuitem.price));

      print('my quantity is  ${cartitem[0].quanity}');
    } else {
      //get the index of already stored item in the cart
      int getIndex =
          cartitem.indexWhere((element) => element.itemId == menuitem.itemId);

      //update the quantity of already stored item in the cart

      cartitem[getIndex].quanity = menuitem.quantity;

      print(cartitem[getIndex].toJson());
    }
  }
}
