import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/carts/model/cart_model.dart';
import 'package:e_commerce/order_history/repository/order_repo.dart';
import 'package:meta/meta.dart';

import '../model/order_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<GetOrderEvent>(getOrderEvent);
    on<StoreOrderEvent>(storeOrderEvent);
  }

  FutureOr<void> getOrderEvent(GetOrderEvent event, Emitter<OrderState> emit) async {
  try{
    emit(OrderLoadingState());
    List<OrderModel> orderItems=await OrderRepo.getOrderData();
    emit(OrderGetSuccessState(orders: orderItems));

  }
  catch(e)
    {
      throw Exception(e.toString());
    }
  }


  FutureOr<void> storeOrderEvent(StoreOrderEvent event, Emitter<OrderState> emit) async{
    try
    {
      emit(OrderStoreLoadingState());
      String message=await OrderRepo.storeOrderData(
          event.date,
        event.items,
      );
      emit(OrderStoreSuccessState(message: message));
    }
    catch(e)
    {
  throw Exception(e.toString());
    }
  }
}
