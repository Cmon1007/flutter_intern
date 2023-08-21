import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../model/product_model.dart';


import 'package:http/http.dart' as http;
class AddNewProduct
{
  static Future<ProductModel?> addProduct()
  async {
    try
    {
      var response= await http.post(Uri.parse("https://dummyjson.com/products/add"),
      headers: {
        'Content-Type': 'application/json'
      },
      body:
          json.encode({
            "products":[
            {
              "id": 1,
              "title": "iPhone 14 Pro",
              "description": "An apple mobile which is nothing like apple",
              "price": 1000,
              "discountPercentage": 10.96,
              "rating": 4.99,
              "stock": 94,
              "brand": "Apple",
              "category": "smartphones",
              "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
              "images": [
                "https://i.dummyjson.com/data/products/1/1.jpg",
                "https://i.dummyjson.com/data/products/1/2.jpg",
              ]
            },
            ],
            "total": 200,
            "skip":0,
            "limit":25
          },)
      );
      if(response.statusCode==200)
      {
        final jsonData=json.decode(response.body);
        final addedProductJson=jsonData['products'];
        return ProductModel.fromJson(addedProductJson);
      }
      return null;
    }
    catch(e)
    {
      throw Exception(e);
    }

  }
}