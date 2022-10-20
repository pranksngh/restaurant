import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Arguments/FoodMenuArg.dart';
import 'package:restaurant/Controllers/FoodCategoryController.dart';
import 'package:restaurant/FoodMenu/FoodMenu.dart';
import 'package:restaurant/Models/MenuCategoryModel.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({super.key});

  static const routeName = "/FoodCategory";

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  final foodCategoryController = Get.put(FoodCategoryController());
  // ignore: non_constant_identifier_names
  // Future<List<MenuCategoryModel>> FetchMenuCategory() async {
  // final assetBundle = DefaultAssetBundle.of(context);

  //final data = await assetBundle.loadString('jsonData/MenuCategory.json');

  // final body = json.decode(data) as List;

  // return body.map((e) => MenuCategoryModel.fromJson(e)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          margin: EdgeInsets.all(15),
          child: GetBuilder<FoodCategoryController>(
              builder: (controller) => FutureBuilder<List<MenuCategoryModel>>(
                  future: foodCategoryController.FetchMenuCategory(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var menu = snapshot.data as List<MenuCategoryModel>;
                      return GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              child: Container(
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Image.network(
                                          menu[index].url,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          menu[index].menuName,
                                          style: GoogleFonts.openSans(
                                              textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 18)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, FoodMenu.routeName,
                                    arguments: FoodMenuArguments(
                                        menu[index].menuid,
                                        menu[index].menuName));
                              },
                            );
                          });
                    } else {
                      return const Text('No data Found');
                    }
                  })),
        ),
      ),
    );
  }
}
