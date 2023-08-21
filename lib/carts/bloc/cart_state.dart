part of 'cart_bloc.dart';

@immutable
abstract class CartState {
}

class CartLoadingState extends CartState{}
class CartSuccessState extends CartState{
  final List<CartItem> carts;
  CartSuccessState(
  {
    required this.carts,
}
      );

}
class CartFailureState extends CartState{
  final String message;
  CartFailureState({
    required this.message,
});
}

class CartStoreLoadingState extends CartState{}
class CartSuccessAddedState extends CartState{
    final String message;
    CartSuccessAddedState(
    {
      required this.message,
}
        );
}
class CartFailureAddedState extends CartState{

}