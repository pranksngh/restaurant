// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant/Cart/Cart.dart';
import 'package:restaurant/Checkout/Checkout.dart';
import 'package:restaurant/Dashboard/Dashboard.dart';
import 'package:restaurant/FoodMenu/FoodCategory.dart';
import 'package:restaurant/FoodMenu/FoodMenu.dart';
import 'package:restaurant/Login/LoginPage.dart';
import 'package:restaurant/OTP/otpscreen.dart';
import 'package:restaurant/Orders/waitingconfirmation.dart';
import 'package:restaurant/Registration/Signup.dart';
import 'package:restaurant/Registration/Step2.dart';
import 'package:restaurant/SplashScreen/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dbHelper/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await GetStorage.init();

  var LoggedIn = prefs.getBool('isLoggedIn') ?? false;

  print(LoggedIn);

  runApp(GetMaterialApp(
    initialRoute: SplashScreen.routeName,
    routes: {
      LoginPage.routeName: (context) => const LoginPage(),
      Signup.routeName: (context) => const Signup(),
      OTPScreen.routeName: (context) => const OTPScreen(),
      Dashboard.routeName: (context) => const Dashboard(),
      Step2.routeName: (context) => Step2(),
      // ignore: missing_required_param
      FoodMenu.routeName: (context) => FoodMenu(),
      FoodCategory.routeName: (context) => const FoodCategory(),
      Cart.routName: (context) => Cart(),
      Checkout.routeName: (context) => Checkout(),
      WaitingConfirmation.routeName: (context) => const WaitingConfirmation(),
      SplashScreen.routeName: (context) => const SplashScreen(),
    },
  ));

  await Mongodatabase.connect();
}
