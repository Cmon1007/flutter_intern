// To parse this JSON data, do
//
//     final cartItem = cartItemFromJson(jsonString);

import 'dart:convert';

import '../../carts/model/cart_model.dart';

OrderModel cartItemFromJson(String str) => OrderModel.fromJson(json.decode(str));

String cartItemToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  final String date;
  List<CartItem> items;

  OrderModel({
    required this.date,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(

    date: json['date'],
    items: List<CartItem>.from(json["items"].map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "items": items.map((e) => e.toJson()).toList()
  };
}
