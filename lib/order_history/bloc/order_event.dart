part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}
class GetOrderEvent extends OrderEvent{

}
class StoreOrderEvent extends OrderEvent{
  final String date;
  final List<CartItem> items;
  StoreOrderEvent({
    required this.date,
    required this.items,
});
}
