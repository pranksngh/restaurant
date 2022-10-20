import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant/Models/UserInfo.dart';
import 'package:restaurant/dbHelper/database.dart';

class UserAuth extends GetxController {
  RxBool isLoggedIn = false.obs;

  GetStorage box = GetStorage();

  UserInfo userDetails = UserInfo();

  setLoginState(value) {
    box.write('isLoggedIn', value);

    isLoggedIn.value = value;
  }

  fetchUserDetails(useremail) {
    return Mongodatabase().fetchUser(useremail).then((value) {
      value.map((e) {
        userDetails = UserInfo(
          name: e['name'],
          email: e['email'],
          mobile: e['mobile'],
          photo: e['photo'],
          city: e['city'],
          address: e['address'],
          pin: e['pin'],
        );
      }).toList();

      update();

      print(userDetails.email);
    });
  }
}
