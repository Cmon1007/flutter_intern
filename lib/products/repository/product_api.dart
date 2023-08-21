import 'dart:convert';

import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo
{
  static Future<List<ProductModel>> fetchProducts()
   async {
  List<ProductModel> products = [];
  try
  {
    var response= await http.get(Uri.parse("https://dummyjson.com/products"));
  if(response.statusCode==200)
  {
  Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData.length);
      ProductModel product=ProductModel.fromJson(responseData);
      products.add(product);
      }
    return products;

    }
      catch(e)
      {
         throw Exception(e);
      }
      }

   Future<List<Product>> fetchProductDetail(int id)
  async {
    final String url= "https://dummyjson.com/products";
    List<Product> products = [];
    try
    {
      var response= await http.get(Uri.parse("$url/$id"));
      if(response.statusCode==200)
      {
        Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData.length);

          Product product=Product.fromJson(responseData);
          products.add(product);
        }
      return products;
      }
    catch(e)
    {
      throw Exception(e);
    }
  }
}


// Map<String, dynamic> responseData = json.decode(response.body);
// print(responseData.length);
// for(int i=0; i<=responseData.length;i++)
// {
// ProductModel product=ProductModel.fromJson(responseData);
// products.add(product);
// }