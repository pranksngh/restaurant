import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitingConfirmation extends StatelessWidget {
  const WaitingConfirmation({super.key});

  static const routeName = "/waitingconfirmation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('assets/images/orderconfirmation.jpg'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Order Sent to Restaurant, Waiting for the confirmation',
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(color: Colors.black)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/images/loading.gif'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
