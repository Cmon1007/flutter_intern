// To parse this JSON data, do
//
//     final cartItem = cartItemFromJson(jsonString);

import 'dart:convert';

CartItem cartItemFromJson(String str) => CartItem.fromJson(json.decode(str));

String cartItemToJson(CartItem data) => json.encode(data.toJson());

class CartItem {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final String thumbnail;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.thumbnail,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    quantity: json["quantity"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "quantity": quantity,
    "thumbnail": thumbnail,
  };
}





// import 'dart:convert';
//
// CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));
//
// String cartModelToJson(CartModel data) => json.encode(data.toJson());
//
// class CartModel {
//   final List<Cart> carts;
//   final int total;
//   final int skip;
//   final int limit;
//
//   CartModel({
//     required this.carts,
//     required this.total,
//     required this.skip,
//     required this.limit,
//   });
//
//   factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
//     carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
//     total: json["total"],
//     skip: json["skip"],
//     limit: json["limit"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
//     "total": total,
//     "skip": skip,
//     "limit": limit,
//   };
// }
//
// class Cart {
//   final int id;
//   final List<Product> products;
//   final int total;
//   final int discountedTotal;
//   final int userId;
//   final int totalProducts;
//   final int totalQuantity;
//
//   Cart({
//     required this.id,
//     required this.products,
//     required this.total,
//     required this.discountedTotal,
//     required this.userId,
//     required this.totalProducts,
//     required this.totalQuantity,
//   });
//
//   factory Cart.fromJson(Map<String, dynamic> json) => Cart(
//     id: json["id"],
//     products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
//     total: json["total"],
//     discountedTotal: json["discountedTotal"],
//     userId: json["userId"],
//     totalProducts: json["totalProducts"],
//     totalQuantity: json["totalQuantity"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "products": List<dynamic>.from(products.map((x) => x.toJson())),
//     "total": total,
//     "discountedTotal": discountedTotal,
//     "userId": userId,
//     "totalProducts": totalProducts,
//     "totalQuantity": totalQuantity,
//   };
// }
//
// class Product {
//   final int id;
//   final String title;
//   final int price;
//   final int quantity;
//   final int total;
//   final double discountPercentage;
//   final int discountedPrice;
//
//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.total,
//     required this.discountPercentage,
//     required this.discountedPrice,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     title: json["title"],
//     price: json["price"],
//     quantity: json["quantity"],
//     total: json["total"],
//     discountPercentage: json["discountPercentage"]?.toDouble(),
//     discountedPrice: json["discountedPrice"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "price": price,
//     "quantity": quantity,
//     "total": total,
//     "discountPercentage": discountPercentage,
//     "discountedPrice": discountedPrice,
//   };
// }
