// ignore_for_file: file_names

import 'package:http/http.dart' as http;

class MenuApi {
  final String menuApiUrl = "https://jsonplaceholder.typicode.com/todos/1";

  getMenuCategory() async {
    http.Response response = await http.get(Uri.parse(menuApiUrl));

    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return "Failed";
      }
    } catch (e) {
      return "failed";
    }
  }
}
