import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  static const routeName = "/signup";

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 40, 50, 1),
      body: Container(
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
                  'Create an Account',
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
                      controller: firstname,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
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
                      controller: lastname,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
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
                      controller: email,
                      decoration: const InputDecoration(
                        hintText: 'Email Address',
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
                      controller: contactNumber,
                      decoration: const InputDecoration(
                        hintText: ' +91 Mobile Number',
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
                            'SIGNUP',
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
                            "Already have an account?",
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(78, 85, 95, 1),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          child: Text(
                            'Login',
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
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
