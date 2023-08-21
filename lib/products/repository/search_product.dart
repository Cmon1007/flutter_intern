import 'dart:convert';

import 'package:http/http.dart'as http;

import '../model/product_model.dart';
class SearchProduct
{
  static Future<List<ProductModel>> searchProduct(String query)
  async {
    List<ProductModel> products = [];
    try
    {
      http.Response response= await http.get(Uri.parse("https://dummyjson.com/products/search?q=$query"));
      if(response.statusCode==200)
      {
        Map<String,dynamic> responseData=jsonDecode(response.body);
            ProductModel product=ProductModel.fromJson(responseData);
            products.add(product);
      }
      return products;

    }
    catch(e)
    {
      throw Exception("Failed: ${e.toString()}");
    }

  }
}