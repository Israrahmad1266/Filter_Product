import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:technical_task/model/product_model.dart';

class ApiServices {
  Future<Product?> myFilterList() async {
    Uri url = Uri.parse("https://www.chukde.com/api/products/search");
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        return Product.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
// the error message shown due to the rating value,
// in some product  rating value in the form of double in some product it's value is iintn  form.