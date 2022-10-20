// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/API/GoogleSignIn.dart';
import 'package:restaurant/Controllers/UserAuth.dart';
import 'package:restaurant/Models/UserInfo.dart';
import 'package:restaurant/Registration/Step2.dart';
import 'package:restaurant/dbHelper/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mongo_dart/mongo_dart.dart' as M;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = "/LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  UserAuth authcontroller = Get.put(UserAuth());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 40, 50, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 20),
                  child: Text(
                    'Welcome\nBack',
                    style: GoogleFonts.openSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Colors.amber,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Text('Sign in to continue',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(78, 85, 95, 1),
                          fontSize: 20,
                        ),
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(25, 32, 42, 1),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: username,
                        maxLength: 10,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: '+91 Mobile Number',
                          fillColor: Colors.white,
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
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: MaterialButton(
                            color: Color.fromRGBO(255, 178, 0, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {
                              if (username.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Enter Mobile Number");
                              } else {
                                if (username.text.length < 10) {
                                  Fluttertoast.showToast(
                                      msg: 'Please Enter Correct Number');
                                } else {
                                  Mongodatabase.isMobileNumberExist(
                                          username.text)
                                      .then((value) => value.isEmpty
                                          ? Fluttertoast.showToast(
                                              msg: "Kindly Signup First")
                                          : print('Number Exist'));
                                }
                              }
                            },
                            child: Text(
                              'SIGN IN',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'OR',
                        style: GoogleFonts.openSans(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Image.network(
                              'https://th.bing.com/th/id/R.c8bf7c087ca9793d094042845707ffac?rik=fjZN1AYH30vXIw&riu=http%3a%2f%2fpngimg.com%2fuploads%2fgoogle%2fgoogle_PNG19635.png&ehk=ZmsumEtoeJQhKoUzQTZO2TEbYPBu0%2b7EFdjmJ3qljls%3d&risl=&pid=ImgRaw&r=0',
                              width: MediaQuery.of(context).size.width *
                                  (50 / 375),
                            ),
                            onTap: () {
                              GoogleLogin();
                            },
                          ),
                          GestureDetector(
                            child: Image.network(
                              'https://www.mmppicture.co.in/wp-content/uploads/2021/03/Facebook-Icon-PNG-21.png',
                              width: MediaQuery.of(context).size.width *
                                  (50 / 375),
                            ),
                            onTap: () {
                              getCoordinates();
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Don't have an account?",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(78, 85, 95, 1),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            child: Text(
                              'Signup',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(78, 85, 95, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GoogleLogin() async {
    final user = await GoogleSignInAPI.googleLogin();
    if (user != null) {
      Mongodatabase.isUserExist(user.email).then((value) {
        if (value.isEmpty) {
          // New user trying to login with google account, then create new user by adding basic details

          print('new user trying to login');
          var id = M.ObjectId();

          final userData = UserInfo(
              name: user.displayName, email: user.email, photo: user.photoUrl);

          //calling adduser funtion to insert data to database

          print('user data : $userData');

          Mongodatabase.addUser(userData).then((value) {
            value == 0
                ? Navigator.pushNamed(context, Step2.routeName,
                    arguments: {'userData': userData})
                : print("Something went wrong");
          });
        } else {
          // Already Exist User trying to login with google account

          print('Already Exist user trying to login with google account');

          //store current login state in shared preferences

          authcontroller.setLoginState(true);

          //fetching user details from database

          authcontroller.fetchUserDetails(user.email);

          // navigate to dashboard page

          Navigator.pushNamed(context, '/dashboard');
        }
      });
    }
  }

  FacebookLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await FacebookAuth.i.login(permissions: [
      'public_profile',
      'email',
    ]);

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData(fields: "email,name");

      Mongodatabase.isUserExist(userData['email']).then((value) {
        if (value.isEmpty) {
          // New user trying to login with facebook account
          print('New user trying to login with facebook account');
        } else {
          // Already Exist User trying to login with facebook account

          print('Already Exist user trying to login with facebook account');

          //store the login state in shared prefrences

          prefs.setBool('isLoggedIn', true);

          // navigate to dashboard page

          Navigator.pushNamed(context, '/dashboard');
        }
      });
    }
  }

  getCoordinates() async {
    List<Location> locations = await locationFromAddress(
        "House No 767 , Sai Nagar, Meethapur Extn, Badarpur , New Delhi , 110044 , new delhi , 110044");

    print(locations[0].latitude);
    print(locations[0].longitude);
  }
}
