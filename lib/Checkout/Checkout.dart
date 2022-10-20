import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Controllers/FoodItemController.dart';
import 'package:restaurant/Models/CartModel.dart';
import 'package:restaurant/Orders/waitingconfirmation.dart';

class Checkout extends StatelessWidget {
  Checkout({super.key});

  FoodItemController controller = Get.put(FoodItemController());
  static const routeName = "/checkout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 248, 250),
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 243, 248, 250),
        title: Text(
          'Order Summary',
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
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: GetX<FoodItemController>(builder: (controller) {
              return controller.cartitem.isEmpty
                  ? const Center(
                      child: Text('Cart is Empty'),
                    )
                  : Column(
                      children: [
                        orderdetails(context),
                        const SizedBox(
                          height: 15,
                        ),
                        CouponRow(context),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Bill Summary',
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18)),
                        ),
                        ServiceMode(context),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Payment Mode',
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18)),
                        ),
                        PaymentMode(context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                        )
                      ],
                    );
            }),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          width: MediaQuery.of(context).size.width,
          child: FloatingActionButton.extended(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              backgroundColor: Colors.black,
              label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Place Order',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(fontSize: 15)),
                    ),
                  ]),
              onPressed: () {
                if (controller.paymentMode.value == "02") {
                  Navigator.pushNamed(context, WaitingConfirmation.routeName);
                }
              })),
    );
  }

  Widget orderdetails(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.cartitem.length,
          itemBuilder: (context, index) {
            return GetX<FoodItemController>(
                builder: ((controllerx) => Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(6),
                    child: itemRow(context, controller.cartitem[index]))));
          }),
    );
  }

  Widget itemRow(BuildContext context, CartModel cartitem) {
    int itemTotal = cartitem.price * cartitem.quanity;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Text(
            '${cartitem.itemName}',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(fontWeight: FontWeight.normal)),
          ),
        ),
        Container(
          child: Row(
            children: [
              IconButton(
                  onPressed: () => controller.increaseQtyOfItemInCart(cartitem),
                  icon: const Icon(Icons.add_circle)),
              Text('${cartitem.quanity}'),
              IconButton(
                  onPressed: () => controller.decreaseQtyOfItemInCart(cartitem),
                  icon: const Icon(Icons.remove_circle))
            ],
          ),
        ),
        Container(
          child: Text('\u{20B9}$itemTotal'),
        ),
      ],
    );
  }

  Widget ServiceMode(BuildContext context) {
    bool _value = false;
    int val = -1;
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          //subtotal row
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    'Total Item Charges',
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Text('\u{20B9}${controller.itemTotal.value.round()}'),
              ],
            ),
          ),

          //tax row
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'Govt Taxes & Restaurant Charges',
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Text('\u{20B9} ${controller.taxValue.value.round()}'),
              ],
            ),
          ),

          //shipping charges row
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'Shipping Charges',
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Text('\u{20B9} ${controller.shippingTotal.value.round()}'),
              ],
            ),
          ),

          //coupon discount row
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'Coupon Discount',
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Text('\u{20B9} ${controller.couponcharges.value.round()}'),
              ],
            ),
          ),

          //Grand Total Row
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'GRAND TOTAL',
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Text('\u{20B9} ${controller.grandTotal.value.round()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget CouponRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: ListTile(
        tileColor: Colors.white,
        title: Text('COUPONS'),
        trailing:
            IconButton(onPressed: () => null, icon: Icon(Icons.arrow_forward)),
      ),
    );
  }

  Widget PaymentMode(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: ListTile(
              leading: Radio(
                value: "01",
                groupValue: controller.paymentMode.value,
                onChanged: (value) {
                  controller.paymentMode.value = value.toString();

                  print('Payment Mode is ${controller.paymentMode.value}');
                },
              ),
              title: Text(
                'Pay Online',
                style: GoogleFonts.openSans(),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Radio(
                value: "02",
                groupValue: controller.paymentMode.value,
                onChanged: (value) {
                  controller.paymentMode.value = value.toString();
                  print('Payment Mode is ${controller.paymentMode.value}');
                },
              ),
              title: Text(
                'Pay Later',
                style: GoogleFonts.openSans(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
