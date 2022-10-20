import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  final ObjectId? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? photo;
  final String? city;
  final String? address;
  final String? pin;
  final String? status;
  final double? long;
  final double? lat;

  UserInfo(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.photo,
      this.city,
      this.address,
      this.pin,
      this.status,
      this.long,
      this.lat});

  //constructor that convert json to object instance
  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        mobile = json['mobile'],
        photo = json['city'],
        city = json['ciyt'],
        address = json['address'],
        pin = json['pin'],
        status = json['status'],
        long = json['long'],
        lat = json['lat'];

  //a method that convert object to json

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'mobile': mobile,
        'photo': photo,
        'city': city,
        'address': address,
        'pin': pin,
        'status': status,
        'long': long,
        'lat': lat
      };
}
