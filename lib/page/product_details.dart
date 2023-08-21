import 'package:e_commerce/carts/bloc/cart_bloc.dart';
import 'package:e_commerce/carts/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../products/bloc/get_products_bloc/get_product_bloc.dart';
class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Product Detail"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            BlocBuilder<ProductDetailBloc, ProductDetailState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ProductLoadingState:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ProductDetailSuccessState:
                    final successState = state as ProductDetailSuccessState;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: successState.detail.length,
                      itemBuilder: (context, index) {
                        final productDetail = successState.detail[index];
                        return Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  if(productDetail.images.isNotEmpty) ... {
                                    ...productDetail.images.map((e) =>
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                              width:346,
                                              height:250,
                                              decoration:BoxDecoration(color: Colors.white),
                                              child: Image.network(e)),
                                        )),
                                  }
                                ],
                              ),
                            ),
                            Container(
                              width:358,
                                height: 450,
                                decoration: BoxDecoration(color: Color(0xff393B44),borderRadius: BorderRadius.circular(18)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(productDetail.title,style: TextStyle(color: Color(0xffE0FCFF),fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                      const SizedBox(height: 10.0,),
                                      Text("Brand: ${productDetail.brand}",style: TextStyle(color: Colors.white)),
                                      Text("Categoty: ${productDetail.category}",style: TextStyle(color: Colors.white)),
                                      Text("Rating: ${productDetail.rating}",style: TextStyle(color: Colors.white)),
                                      Text("Discount on Product: ${productDetail.discountPercentage} %",style: TextStyle(color: Colors.white)),
                                      const SizedBox(height: 10.0,),
                                      Text("Description",style: TextStyle(color: Color(0xffE0FCFF),fontSize: 25,fontWeight: FontWeight.bold),),
                                      Container(
                                        height: 80,
                                        width:350,
                                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(productDetail.description),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0,),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Total Price",style: TextStyle(color: Colors.white.withOpacity(0.5),)),
                                              Text("\$ ${productDetail.price}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0,),
                                      ElevatedButton(
                                          style:ElevatedButton.styleFrom(backgroundColor: Color(0xffD4ADFC),fixedSize: Size(350, 60),
                                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)) ),
                                          onPressed: () async {
                                            context.read<CartBloc>().add(GetCartItemEvent(
                                                id: productDetail.id,
                                                title: productDetail.title,
                                                quantity: 1,
                                                price: productDetail.price,
                                                thumbnail: productDetail.thumbnail
                                            ));
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("Item added to cart",textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
                                                duration: Duration(seconds: 1),backgroundColor: Color(0xffDFEEEA),));
                                            // SharedPreferences _prefs= await SharedPreferences.getInstance();
                                            // _prefs.setString('cart', items as String);
                                      }, child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.shopping_bag,size: 30,),
                                          const SizedBox(width: 20,),
                                          Text("Add to Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                                        ],
                                      )
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        );
                      },);
                  default: return Container();
                }

              },)
          ],
        ),
      ),
    );
  }
}