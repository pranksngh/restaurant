// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Checkout/Checkout.dart';
import 'package:restaurant/Controllers/FoodItemController.dart';
import 'package:restaurant/Models/CartModel.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  FoodItemController fooditemcontroller = Get.put(FoodItemController());

  static const routName = "/cart";

  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My Cart',
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
          child: Column(children: [
            GetX<FoodItemController>(
                builder: ((controller) => fooditemcontroller.cartitem.isEmpty
                    ? const Center(child: Text('cart is empty'))
                    : Expanded(
                        child: ListView.builder(
                            itemCount: fooditemcontroller.cartitem.length,
                            itemBuilder: (context, index) {
                              return CartRow(
                                  controller: fooditemcontroller,
                                  cartitem: fooditemcontroller.cartitem[index]);
                            }))))
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          child: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Proceed to checkout',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(fontSize: 15)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 20,
                  )
                ]),
            onPressed: () => Navigator.pushNamed(context, Checkout.routeName),
          )),
    );
  }
}

class CartRow extends StatelessWidget {
  FoodItemController controller;

  CartModel cartitem;
  CartRow({super.key, required this.controller, required this.cartitem});

  @override
  Widget build(BuildContext context) {
    int itemTotal = cartitem.price * cartitem.quanity;
    return Card(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Image.network(
              cartitem.itemImage,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    cartitem.itemName,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.5)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(
                    '\u{20B9}${cartitem.price}',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      iconSize: 30,
                      color: Colors.black,
                      icon: const Icon(Icons.add_circle),
                      onPressed: () {
                        controller.increaseQtyOfItemInCart(cartitem);
                      },
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Text('${cartitem.quanity}')),
                    IconButton(
                        iconSize: 30,
                        color: Colors.black,
                        icon: const Icon(
                          Icons.remove_circle,
                        ),
                        onPressed: () {
                          controller.decreaseQtyOfItemInCart(cartitem);
                        }),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: IconButton(
                      onPressed: (() =>
                          controller.removeItemFromCart(cartitem)),
                      icon: Icon(Icons.delete)),
                ),
                SizedBox(),
                Container(
                  child: Text(
                    '\u{20B9}$itemTotal',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
