import 'dart:convert';

import 'package:e_commerce/carts/bloc/cart_bloc.dart';
import 'package:e_commerce/page/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../carts/model/cart_model.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 65,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("My Cart",style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),),
              Padding(
                padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 6.0),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  height: 420,
                  child: BlocBuilder<CartBloc,CartState>(
                    bloc: _bloc,
                    builder: (context, state) {
                  if(state is CartSuccessState)
                    {
                      final items=state.carts;
                      if(items.isEmpty)
                        {
                          return Center(child: Text("Your cart is empty"),);
                        }
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final cartItems=items[index];
                          final quantity= quantities[index]??1;
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
                      },);
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

                  },),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(color: Color(0xffFFF4D2),borderRadius: BorderRadius.circular(20.0)),
                  child: Center(child: Text("Total Price: \$ ${newTotalPrice}",style: TextStyle(color: Colors.black,fontSize: 25),)),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                    fixedSize: Size(350, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentPage(),));
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Procced to Checkout",style: TextStyle(color: Colors.white,fontSize: 20),),
                  Icon(Icons.chevron_right_rounded,color: Colors.white,size: 35,)
                ],
              ),)
            ],
          ),
        )
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
        await _prefs.setString('cart', jsonEncode(cartData));
      }
    }
  }
}
