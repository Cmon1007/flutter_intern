part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}
class AddToCartEvent extends CartEvent{

}
class RemoveFromCartEvent extends CartEvent
{
  final CartItem item;
  RemoveFromCartEvent(
  {
    required this.item,
}
      );
}
class GetCartItemEvent extends CartEvent{
  final int id;
  final String title;
  final int price;
  final int quantity;
  final String thumbnail;
  GetCartItemEvent(
  {
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.thumbnail,
}
      );
}
