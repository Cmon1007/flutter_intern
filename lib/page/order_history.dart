import 'package:e_commerce/order_history/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OrderBloc bloc=OrderBloc();
  @override
  void initState() {
    bloc.add(GetOrderEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<OrderBloc,OrderState>(
        bloc: bloc,
        builder: (context, state) {
          if(state is OrderLoadingState)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          else if(state is OrderGetSuccessState)
            {
              final order=state.orders;
              if(order.isEmpty)
                {
                  return Center(child: Text("There is no order"),);
                }
              return Column(
                children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: order.length,
                      itemBuilder: (context, index) {
                      final orders=order[index];
                      final date=orders.date;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Date: ${date.toString()}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0),),
                            Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.black,),borderRadius: BorderRadius.circular(10.0)),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: orders.items.length,
                                itemBuilder: (context, index) {
                                  final orderItem=orders.items[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,),borderRadius: BorderRadius.circular(18.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    height:100,
                                                    width:100,
                                                    child: Image.network(orderItem.thumbnail)
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 6.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          height:40,
                                                          width: 100,
                                                          child: Text(orderItem.title,softWrap: true,
                                                            maxLines: 2,)),
                                                      Text("\$ ${orderItem.price.toString()}"),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                              },),
                            ),
                            Divider(color: Colors.black,thickness: 3,),
                          ],
                        ),
                      );
                    },),
                  ),
                )
                ],
              );
            }
          else if(state is OrderGetFailureState)
            {
              return Center(child: Text("Error data"),);
            }
          else
            {
              return Center(child: CircularProgressIndicator(),);
            }
        },)
      );
  }
}
