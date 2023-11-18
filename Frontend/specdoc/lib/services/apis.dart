import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:specdoc/models/categories.dart';

class ApiCalls {
  var baseUrl = 'http://192.168.2.52:8000';
  List<String> title = [];
  List<String> desc = [];

  void getCategories() async {
    try {
      var url = Uri.parse('$baseUrl/categories');
      var res = await http.get(url);
      var response = jsonDecode(res.body);
      List<Categories> categoriesList =
          Categories().fromListJson(response['data']);

      for (var i = 0; i < categoriesList.length; i++) {
        title.add(categoriesList[i].title!);
        desc.add(categoriesList[i].desc!);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Categories>> search(String searchString) async {
    try {
      var url = Uri.parse('$baseUrl/search');
      var res = await http.post(
        url,
        body: jsonEncode(
          {
            "search": searchString,
          },
        ),
      );
      var response = jsonDecode(res.body);
      List<Categories> categoriesList =
          Categories().fromListJson(response['data']);
      return categoriesList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
