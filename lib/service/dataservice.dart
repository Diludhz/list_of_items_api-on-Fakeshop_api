import 'dart:convert';
import 'package:list_of_items_api/model/datamodel.dart';
import 'package:http/http.dart' as http;

class DataService {
  var uri = "https://fakestoreapi.com/products";
  Future<List<DataModel>?> getmethod() async {
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      return List<DataModel>.from(body.map((e) => DataModel.fromjson(e)));
    } else {
      return null;
    }
  }
}
