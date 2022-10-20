class CartModel {
  String menuid;
  String itemId;
  String itemName;
  String menuName;
  String itemImage;
  int quanity;
  int price;

  CartModel(
      {required this.menuid,
      required this.itemId,
      required this.itemName,
      required this.menuName,
      required this.itemImage,
      required this.quanity,
      required this.price});

  CartModel.fromJson(Map<String, dynamic> json)
      : menuid = json['menuid'],
        itemId = json['itemId'],
        itemName = json['itemName'],
        menuName = json['menuName'],
        itemImage = json['itemImage'],
        quanity = json['quanity'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'menuid': menuid,
        'itemId': itemId,
        'itemName': itemName,
        'menuName': menuName,
        'itemImage': itemImage,
        'quanity': quanity,
        'price': price
      };
}
