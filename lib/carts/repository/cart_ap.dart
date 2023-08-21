import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/cart_model.dart';

class CartRepo
{
  static Future<String> storeCartData(int id, String title, int price, int quantity, String thumbnail) async
  {
    List<CartItem> cartItems=[];
    try
        {
          SharedPreferences _prefs= await SharedPreferences.getInstance();
          final jsonData=_prefs.getString('cart');
          if(jsonData!=null)
            {
              try
                  {
                    final jsonDecodeData=jsonDecode(jsonData);
                    if(jsonDecodeData is List<dynamic>)
                    {
                      cartItems=jsonDecodeData.map((e) => CartItem.fromJson(e)).toList();

                    }
                    else if(jsonDecodeData is Map<String,dynamic>)
                    {
                      cartItems.add(CartItem.fromJson(jsonDecodeData));
                    }
                  }
                  catch(e)
                  {
                      throw Exception("Error: ${e.toString()}");
                      }
            }
              CartItem cartItem=CartItem(
                  id: id,
                  title: title,
                  price: price,
                  quantity: quantity,
                  thumbnail: thumbnail);
              cartItems.add(cartItem);

          List<Map<String,dynamic>> jsonDataList=cartItems.map((cartItem) => cartItem.toJson()).toList();
          String jsonEncodedData=json.encode(jsonDataList);
          await _prefs.setString('cart', jsonEncodedData);
          return "Item added in cart";
        }
        catch(e)
    {
      throw Exception(e.toString());
    }
  }

  static Future<List<CartItem>> getCartItem() async
  {
    List<CartItem> cartItems=[];
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    String ?jsonData=_prefs.getString('cart');
    if(jsonData!=null)
      {
        try{
          final jsonDecodedData=json.decode(jsonData) as List<dynamic>;
          cartItems=jsonDecodedData.map((e) => CartItem.fromJson(e)).toList();
        }
        catch(e)
    {
      throw Exception(e.toString());
    }
        return cartItems;
      }
    else{
      return cartItems=[];
    }
  }
}