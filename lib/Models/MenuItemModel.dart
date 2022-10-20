class MenuItemModel {
  String itemId;
  String menuid;
  String itemName;
  int price;
  int quantity;
  String image;
  String description;

  MenuItemModel({
    required this.itemId,
    required this.menuid,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.image,
    required this.description,
  });

  MenuItemModel.fromJson(Map<String, dynamic> json)
      : itemId = json['itemId'],
        menuid = json['menuid'],
        itemName = json['itemName'],
        price = json['price'],
        quantity = json['quantity'],
        image = json['image'],
        description = json['description'];

  //a method that convert object to json

  Map<String, dynamic> toJson() => {
        'itemId': itemId,
        'menuid': menuid,
        'itemName': itemName,
        'price': price,
        'quantity': quantity,
        'image': image,
        'description': description,
      };
}
