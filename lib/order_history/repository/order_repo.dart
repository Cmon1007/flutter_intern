import 'dart:convert';

import 'package:e_commerce/carts/model/cart_model.dart';
import 'package:e_commerce/order_history/model/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo
{
  static Future<String> storeOrderData(String date,List<CartItem> items) async
  {
    List<OrderModel> orders=[];
    try
        {
          SharedPreferences _prefs= await SharedPreferences.getInstance();
          final jsonData=_prefs.getString('order');
          if(jsonData!=null)
            {
              try{
                final jsonDecodedData=jsonDecode(jsonData);
                if(jsonDecodedData is List<dynamic>)
                  {
                    orders=jsonDecodedData.map((e) => OrderModel.fromJson(e)).toList();
                  }
                else if(jsonDecodedData is Map<String,dynamic>)
                  {
                    orders.add(OrderModel.fromJson(jsonDecodedData));
                  }
              }catch(e)
    {
      throw Exception(e.toString());
    }
            }
          OrderModel orderItem=OrderModel(
         date: date,
            items: items,
          );
          orders.add(orderItem);
          List<Map<String,dynamic>> jsonDataList=orders.map((orderItem) => orderItem.toJson()).toList();
          String jsonEncodedData=json.encode(jsonDataList);
          await _prefs.setString('order', jsonEncodedData);
          return "order stored";
        }
        catch(e)
    {
      throw Exception('Error: ${e.toString()}');
    }
  }
  static Future<List<OrderModel>> getOrderData() async
  {
    List<OrderModel> orders=[];
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    String? jsonData=_prefs.getString('order');
    if(jsonData!=null)
      {
        try
            {
              final jsonDecodedData=json.decode(jsonData) as List<dynamic>;
              orders=jsonDecodedData.map((e) => OrderModel.fromJson(e)).toList();
            }catch(e)
    {
      throw Exception(e.toString());
    }
    return orders;
      }
    else{
      return orders=[];
    }
  }
}