import 'dart:convert';

MenuCategoryModel menuCategoryModelfromJson(String str) =>
    MenuCategoryModel.fromJson(json.decode(str));

String userInfoToJson(MenuCategoryModel data) => json.encode(data.toJson());

class MenuCategoryModel {
  String menuid;

  String menuName;
  String url;

  MenuCategoryModel(
      {required this.menuid, required this.menuName, required this.url});

//constructor that convert json to object instance

  MenuCategoryModel.fromJson(Map<String, dynamic> json)
      : menuid = json['menuid'],
        menuName = json['menuName'],
        url = json['image'];

  //a method that convert object to json

  Map<String, dynamic> toJson() => {
        'menuid': menuid,
        'menuName': menuName,
        'url': url,
      };
}
