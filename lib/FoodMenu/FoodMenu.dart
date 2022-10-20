import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Arguments/FoodMenuArg.dart';
import 'package:restaurant/Cart/Cart.dart';
import 'package:restaurant/Controllers/CartController.dart';
import 'package:restaurant/Controllers/FoodItemController.dart';
import 'package:restaurant/Models/CartModel.dart';
import 'package:restaurant/Models/MenuItemModel.dart';

class FoodMenu extends StatelessWidget {
  String menuid;
  FoodMenu({super.key, required this.menuid});
  static const routeName = "/FoodMenu";
  final fooditemcontroller = Get.put(FoodItemController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as FoodMenuArguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Food Menu',
            style: GoogleFonts.openSans(
                textStyle: const TextStyle(
              color: Colors.black,
            )),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: GetBuilder<FoodItemController>(
                  builder: (controller) => FutureBuilder<List<MenuItemModel>>(
                      future: fooditemcontroller.FetchMenuItem(context, arg),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: fooditemcontroller.menuitemlist.length,
                              itemBuilder: (context, index) {
                                return MenuItemCard(
                                  menuitem:
                                      fooditemcontroller.menuitemlist[index],
                                  menuName: arg.menuName,
                                  itemController: fooditemcontroller,
                                  cartController: cartController,
                                );
                              });
                        } else {
                          return Container();
                        }
                      })),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              label: GetX<FoodItemController>(
                  builder: ((controller) => Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Subtotal : \u{20B9}${fooditemcontroller.itemTotal.value.round()}',
                            style: GoogleFonts.openSans(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ),
                          Text(
                            '${fooditemcontroller.itemcount.value} item added',
                            style: GoogleFonts.openSans(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ),
                          IconButton(
                              onPressed: () => null,
                              icon: Icon(Icons.arrow_forward))
                        ],
                      )))),
              onPressed: () => Navigator.pushNamed(context, Cart.routName),
            )));
  }
}

class MenuItemCard extends StatelessWidget {
  MenuItemModel menuitem;
  String menuName;
  FoodItemController itemController;
  CartController cartController;

  MenuItemCard(
      {super.key,
      required this.menuitem,
      required this.cartController,
      required this.itemController,
      required this.menuName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Image.network(
              menuitem.image,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    menuitem.itemName,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    menuitem.description,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 11)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  CartModel? selectedModel = itemController.cartitem
                      .firstWhereOrNull((selectedItem) =>
                          selectedItem.itemId == menuitem.itemId);

                  if (selectedModel == null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          iconSize: 30,
                          color: Colors.black,
                          icon: Icon(Icons.add_circle),
                          onPressed: () {
                            itemController.increaseQty(menuitem, menuName, 0);
                          },
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text('0')),
                        IconButton(
                          iconSize: 30,
                          color: Colors.black,
                          icon: const Icon(
                            Icons.remove_circle,
                          ),
                          onPressed: () => menuitem.quantity != 0
                              ? itemController.decreaseQty(
                                  menuitem, menuName, 0)
                              : null,
                        ),
                      ],
                    );
                  } else {
                    return selectQuantityRow(selectedModel);
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget selectQuantityRow(CartModel selectedModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          iconSize: 30,
          color: Colors.black,
          icon: Icon(Icons.add_circle),
          onPressed: () {
            itemController.increaseQty(
                menuitem, menuName, selectedModel.quanity);
          },
        ),
        Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(menuitem.quantity.toString())),
        IconButton(
          iconSize: 30,
          color: Colors.black,
          icon: const Icon(
            Icons.remove_circle,
          ),
          onPressed: () => menuitem.quantity != 0
              ? itemController.decreaseQty(
                  menuitem, menuName, selectedModel.quanity)
              : null,
        ),
      ],
    );
  }
}
