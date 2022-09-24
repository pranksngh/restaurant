// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 40, 50, 1),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(25, 32, 42, 1),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                        hintText: '+91 Mobile Number',
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
                      controller: password,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.remove_red_eye_sharp,
                          color: Color.fromRGBO(78, 85, 95, 1),
                        ),
                        hintText: 'Password',
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
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remember Me',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(78, 85, 95, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          'Forgot Password?',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(78, 85, 95, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
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
                          onPressed: () {},
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
    );
  }
}
