import 'dart:convert';
import 'package:e_commerce/carts/bloc/cart_bloc.dart';
import 'package:e_commerce/order_history/bloc/order_bloc.dart';
import 'package:e_commerce/page/payment_page.dart';
import 'package:e_commerce/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<int ,int> quantities={};
   int newTotalPrice=0;
  CartBloc _bloc=CartBloc();
  @override
  void initState() {
    _bloc.add(AddToCartEvent());
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cart",style: TextStyle(fontSize: 20),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          leading: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),
        ),
        body: BlocBuilder<CartBloc,CartState>(
          bloc: _bloc,
          builder: (context, state) {
        if(state is CartSuccessState)
          {
            final items=state.carts;
            if(items.isEmpty)
              {
                return const Center(child: Text("Your cart is empty"),);
              }
            newTotalPrice=items.fold<int>(0, (sum, item){
              final quantity=quantities[items.indexOf(item)]??1;
              return sum +(item.price*quantity);
            });
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(5.0)),
                    height:420,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final cartItems=items[index];
                        final quantity= quantities[index]??1;
                        final id=cartItems.id;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6.0,bottom: 6.0),
                                        child: Container(
                                          decoration: BoxDecoration(color: Colors.white,shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(12.0)),
                                          height: 90,
                                          width: 100,
                                          child: Image.network(cartItems.thumbnail),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width:200,
                                                height: 35,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        height:40,
                                                        width: 100,
                                                        child: Text(cartItems.title,softWrap: true,
                                                        maxLines: 2,)),
                                                    Spacer(),
                                                    InkWell(
                                                      child: Container(
                                                        color: Colors.black,
                                                        height: 20,
                                                        width: 20,
                                                        child: Center(child: Icon(Icons.minimize,size: 15,color: Colors.white,)),
                                                      ),
                                                      onTap: (){
                                                        setState(() {
                                                          if(quantity>1)
                                                            {
                                                              quantities[index]=quantity-1;
                                                            }
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 10.0,),
                                                    Text("${quantity}",style: TextStyle(color: Colors.black),),
                                                    const SizedBox(width: 10.0,),
                                                    InkWell(
                                                      child: Container(
                                                        color: Colors.black,
                                                        height: 20,
                                                        width: 20,
                                                        child: Icon(Icons.add,size: 15,color: Colors.white,),
                                                      ),
                                                      onTap: (){
                                                        setState(() {
                                                          quantities[index]=quantity+1;
                                                        });
                                                      },
                                                    )
                                                  ],
                                                )),
                                            Row(
                                              children: [
                                                Container(
                                                  width:200,
                                                    height: 40,
                                                    child: Row(
                                                      children: [
                                                        Text("\$ ${cartItems.price.toString()}"),
                                                        Spacer(),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 16.0),
                                                          child: InkWell(child: Icon(Icons.delete,color: Colors.red,size: 30,),
                                                          onTap: () {
                                                                setState(()  {
                                                                  items.removeAt(index);
                                                                  removeCartItem(index);
                                                                });
                                                          },
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Text("Total: \$ ${cartItems.price*quantity}"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                    },),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(color: Color(0xffFFF4D2),borderRadius: BorderRadius.circular(20.0)),
                    child: Center(child: Text("Total Price: \$ ${newTotalPrice}",style: TextStyle(color: Colors.black,fontSize: 25),)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                      fixedSize: Size(350, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    final DateTime date=DateTime.now();
                    context.read<OrderBloc>().add(StoreOrderEvent(
                        date: date.toString(),
                        items: state.carts,
                    ));

                    Get.to(PaymentPage());
                  }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Procced to Checkout",style: TextStyle(color: Colors.white,fontSize: 20),),
                    Icon(Icons.chevron_right_rounded,color: Colors.white,size: 35,),

                  ],
                ),)
              ],
            );
          }
        else if(state is CartFailureState)
          {
            return Center(
              child: Text("Failed to get cart items"),
            );
          }
        else
          {
            return Center(child: CircularProgressIndicator(),);
          }

        },)
      ),
    );
  }
  Future<void> removeCartItem(int index) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final cartJson = _prefs.getString('cart');
    if (cartJson != null) {
      final cartData = jsonDecode(cartJson) as List<dynamic>;
      if (index >= 0 && index < cartData.length) {
        cartData.removeAt(index);
        final updatedCartJson=jsonEncode(cartData);
        await _prefs.setString('cart', updatedCartJson);
      }
    }
  }
  Future<void> removeCart()
  async {
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    _prefs.remove('cart');
  }
}
