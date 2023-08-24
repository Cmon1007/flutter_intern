part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderLoadingState extends OrderState{

}
class OrderStoreLoadingState extends OrderState{

}
class OrderStoreSuccessState extends OrderState{
    final String message;
    OrderStoreSuccessState({
        required this.message,
});
}
class OrderStoreFailureState extends OrderState{
    final String error;
    OrderStoreFailureState({
        required this.error,
}
        );

}
class OrderGetSuccessState extends OrderState{
    final List<OrderModel> orders;
    OrderGetSuccessState({
        required this.orders,
});

}
class OrderGetFailureState extends OrderState{
    final String error;
    OrderGetFailureState({
        required this.error,
    }
        );
}
