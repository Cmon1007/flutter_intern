import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_commerce/carts/model/cart_model.dart';
import 'package:e_commerce/carts/repository/cart_ap.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartSuccessState(carts: const [])) {
    on<AddToCartEvent>(addToCartEvent);
    // on<RemoveFromCartEvent>(removeFromCartEvent);
    on<GetCartItemEvent>(getCartItemEvet);
    // loadSavedData();
    }
    // List<CartItem> cartItems=[];
    // Future<void> loadSavedData()
    // async {
    //   SharedPreferences _prefs= await SharedPreferences.getInstance();
    //  final savedData= _prefs.getStringList('cart');
    //   if(savedData!=null)
    //     {
    //        cartItems=savedData.map((e) => CartItem.fromJson(e as Map<String, dynamic>)).toList();
    //        emit(CartSuccessState(carts: cartItems));
    //     }
    //
    // }
    // Future<void> saveCartData()
    // async {
    //   SharedPreferences _prefs=await SharedPreferences.getInstance();
    //   final itemList=cartItems.map((item) => item.toJson()).toList();
    //   _prefs.setStringList('cart', itemList.cast<String>());
    // }
  FutureOr<void> addToCartEvent(AddToCartEvent event, Emitter<CartState> emit) async{
      try
      {
        emit(CartLoadingState());
        List<CartItem> cartItems= await CartRepo.getCartItem();
        emit(CartSuccessState(carts: cartItems));
      }
      catch(e)
    {
      throw Exception(e.toString());
    }


  }

  // FutureOr<void> removeFromCartEvent(RemoveFromCartEvent event, Emitter<CartState> emit) {
  //   if(state is CartSuccessState){
  //     final currentState=state as CartSuccessState;
  //     final updateCart=List.of(currentState.carts)..remove(event.item);
  //     emit(CartSuccessState(carts: updateCart));
  //   }
  // }

  FutureOr<void> getCartItemEvet(GetCartItemEvent event, Emitter<CartState> emit) async{
    try
    {
      emit(CartStoreLoadingState());
      String message= await CartRepo.storeCartData(event.id, event.title, event.price, event.quantity, event.thumbnail);
      emit(CartSuccessAddedState(message: message));
    }
    catch(e)
    {
      throw Exception(e.toString());
    }

  }
}

