import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:restaurant/Models/UserInfo.dart';
import 'package:restaurant/dbHelper/constants.dart';

class Mongodatabase {
  static var db, dbcollection;
  static connect() async {
    db = await Db.create(MONG0_CONN_URL);
    await db.open();

    inspect(db);

    dbcollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> isMobileNumberExist(
      mobileNumber) async {
    final data = await dbcollection.find({'mobile': mobileNumber}).toList();

    print(data.length);

    return data;
  }

  static Future<List<Map<String, dynamic>>> isUserExist(userEmail) async {
    final data = await dbcollection.find({'email': userEmail}).toList();

    return data;
  }

  Future<List<Map<String, dynamic>>> fetchUser(userEmail) async {
    final data = await dbcollection.find({'email': userEmail}).toList();

    return data;
  }

  static Future<dynamic> addUser(UserInfo userData) async {
    try {
      var result = await dbcollection.insertOne(userData.toJson());

      if (result.isSuccess) {
        return 0;
      } else {
        return 1;
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
