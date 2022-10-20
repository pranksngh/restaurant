import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Dashboard/Dashboard.dart';
import 'package:restaurant/Models/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step2 extends StatefulWidget {
  Step2({
    super.key,
  });

  static const routeName = "/step2";

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  TextEditingController AddressLine1 = TextEditingController();
  TextEditingController AddressLine2 = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 40, 50, 1),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      left: 40, right: 40, top: 40, bottom: 20),
                  child: Text(
                    'Add Address',
                    style: GoogleFonts.openSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Colors.amber,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(25, 32, 42, 1),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: AddressLine1,
                        maxLength: 50,
                        decoration: const InputDecoration(
                          hintText: 'Address Line 1',
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(78, 85, 95, 1)),
                          focusColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(78, 85, 95, 1),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(78, 85, 95, 1),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: AddressLine2,
                        maxLength: 50,
                        decoration: const InputDecoration(
                          hintText: 'Address Line 2',
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(78, 85, 95, 1)),
                          focusColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(78, 85, 95, 1),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(78, 85, 95, 1),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: city,
                        decoration: const InputDecoration(
                          hintText: 'City',
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(78, 85, 95, 1)),
                          focusColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(78, 85, 95, 1),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(78, 85, 95, 1),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: pincode,
                        maxLength: 6,
                        decoration: const InputDecoration(
                          hintText: ' Pin Code',
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(78, 85, 95, 1)),
                          focusColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(78, 85, 95, 1),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(78, 85, 95, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: MaterialButton(
                            color: const Color.fromRGBO(255, 178, 0, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {},
                            child: Text(
                              'Submit',
                              style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "OR",
                              style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (10 / 812),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: MaterialButton(
                            color: const Color.fromRGBO(255, 178, 0, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {},
                            child: Text(
                              'Use Current Location',
                              style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(33, 40, 50, 1),
        onPressed: () {
          print('my data is ${userData['userData']}');
          //calling skipnow function and passing instance of userdata in it to store it in a shared preferences
          SkipNowFunction(userData['userData']);
        },
        label: Text(
          'Skip Now',
          style: GoogleFonts.openSans(color: Colors.amber),
        ),
        elevation: 0,
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }

  SkipNowFunction(UserInfo userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userinfo = jsonEncode(userInfo);

    prefs.setString('userdata', userinfo);

    Navigator.pushNamed(context, Dashboard.routeName);
  }
}
