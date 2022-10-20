import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Controllers/UserAuth.dart';
import 'package:restaurant/FoodMenu/FoodCategory.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserAuth userAuth = Get.put(UserAuth());
  var user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => callSnackBar());

    // getUserInfo();
  }

  // getUserInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //  Map<String,dynamic> jsondatais = jsonDecode(prefs.getString('userdata')!);
  //   setState((){
  //    user = UserInfo.fromJson(jsondatais);
  //   if(user.lat == "null"){
  //     print('please complete your profile first');
  //   }
  //   });

  callSnackBar() {
    print('calling snackbar function');
    return userAuth.userDetails.email != null
        ? Get.snackbar(
            "GeeksforGeeks",
            "Hello everyone",
            icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.apps,
          color: Colors.black,
          size: MediaQuery.of(context).size.width * (25 / 312),
        ),
        title: Center(
          child: Text(
            'Demore',
            style:
                GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black)),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => null,
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: MediaQuery.of(context).size.width * (25 / 312),
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // 1st restaurant container card start
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.5,
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.wdYuNxgcJLY0DfH7ogP-WwHaFp?pid=ImgDet&rs=1'),
                    ),
                    color: Colors.amber,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: (MediaQuery.of(context).size.height / 3) * 0.8,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 25),
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text('DyoMore Restaurant',
                                        style: GoogleFonts.openSans(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 28))),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 25),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      'Post Impressionate Painting',
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: (MediaQuery.of(context).size.height / 3) *
                                  0.8,
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: (MediaQuery.of(context).size.height / 3) * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text(
                                'Tickets Available',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: const Text(
                                '29 Sept - 10  oct 2022',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () =>
                    Navigator.pushNamed(context, FoodCategory.routeName),
              ),
              // 1st restaurant card end

              // 2nd card start
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.5,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.wdYuNxgcJLY0DfH7ogP-WwHaFp?pid=ImgDet&rs=1'),
                  ),
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height / 3) * 0.8,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 25),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text('DyoMore Restaurant',
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28))),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 25),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    'Post Impressionate Painting',
                                    style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height:
                                (MediaQuery.of(context).size.height / 3) * 0.8,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height / 3) * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'Tickets Available',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: const Text(
                              '29 Sept - 10  oct 2022',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 2nd card end

              //3rd card start
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.5,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.wdYuNxgcJLY0DfH7ogP-WwHaFp?pid=ImgDet&rs=1'),
                  ),
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height / 3) * 0.8,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 25),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text('DyoMore Restaurant',
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28))),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 25),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    'Post Impressionate Painting',
                                    style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height:
                                (MediaQuery.of(context).size.height / 3) * 0.8,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height / 3) * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'Tickets Available',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: const Text(
                              '29 Sept - 10  oct 2022',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //3rd card end
            ],
          ),
        ),
      ),
    );
  }
}
