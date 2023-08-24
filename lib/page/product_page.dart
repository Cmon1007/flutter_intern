import 'package:e_commerce/page/order_history.dart';
import 'package:e_commerce/page/product_details.dart';
import 'package:e_commerce/page/sign_in_page.dart';
import 'package:e_commerce/page/user_page.dart';
import 'package:e_commerce/products/fields/search_field.dart';
import 'package:e_commerce/signin/sign_in_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../products/bloc/get_products_bloc/get_product_bloc.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  final ProductDetailBloc _productBloc=ProductDetailBloc();
  String searchQuery="";
  @override
  void initState() {
    _productBloc.add(GetProductDetailEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Products".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 20.0),),
        iconTheme: IconThemeData(color: Colors.black,size: 30),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.black,size: 45,)),
              onTap: ()=>Get.to(UserPage()),
            ),
          ),
        ],
        elevation: 0,
      ),
      drawer: SafeArea(
        child: Drawer(
          width: 250,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),side: BorderSide(color: Colors.black)),
          backgroundColor: Color(0xffBCCEF8),
          child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if(state is AuthSuccessState)
              {
                final user=state.userData;
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0,),
                      InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 55.0,
                          child: Image.network(user.image,height: 80,width: 80,),
                        ),
                        // onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderHistory(),)),
                      ),
                      Text(user.username),
                      Text("Email: ${user.email}"),
                      Divider(color: Colors.black,thickness: 4),
                      Row(
                        children: [
                          Container(
                              width: 150,
                              child: Text("Profile",style: TextStyle(fontSize: 18),)
                          ),
                          const SizedBox(width: 40,),
                          Icon(Icons.person_pin_outlined,color: Colors.white,size: 30,)
                        ],
                      ),
                      Divider(color: Colors.white,thickness: 1),
                      Row(
                        children: [
                          Container(
                              width: 150,
                              child: InkWell(child: Text("Order History",style: TextStyle(fontSize: 18),),
                                onTap: ()=>Get.to(OrderHistory()),
                              )
                          ),
                          const SizedBox(width: 40,),
                          Icon(Icons.add_shopping_cart,color: Colors.white,size: 30)
                        ],
                      ),
                      Divider(color: Colors.white,thickness: 1),
                      Row(
                        children: [
                          Container(
                              width: 150,
                              child: Text("Favourites",style: TextStyle(fontSize: 18),)
                          ),
                          const SizedBox(width: 40,),
                          Icon(Icons.favorite_border_outlined,color: Colors.white,size: 30,)
                        ],
                      ),
                      Divider(color: Colors.white,thickness: 1),
                      Row(
                        children: [
                          Container(
                              width: 150,
                              child: Text("Logout",style: TextStyle(fontSize: 18),)
                          ),
                          const SizedBox(width: 40,),
                          InkWell(child: Icon(Icons.logout,color: Colors.white,size: 30,),
                          onTap: ()=>showDialog(context: context, builder: (context) => AlertDialog(title: Column(
                            children: [
                              Text("Logout",style: TextStyle(color: Colors.red,fontSize: 25.0,fontWeight: FontWeight.bold),),
                              Text("Do you want to Logout?"),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      child: Text("Yes",style: TextStyle(color: Colors.red),),
                                      onTap: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage(),));
                                        _logoutUser();
                                      }
                                  ),
                                  const SizedBox(width: 50,),
                                  InkWell(
                                    child: Text("No",style: TextStyle(color: Colors.green)),
                                    onTap: ()=>Navigator.of(context).pop(),
                                  )
                                ],
                              )
                            ],
                          ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                          ),),
                          )
                        ],
                      ),
                      Divider(color: Colors.white,thickness: 1),
                    ],
                  ),
                );
              }
            return Container();
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome,",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Text("Our Ecommerce App ",style: TextStyle(fontSize: 20,color: Colors.grey)),
              const SizedBox(height: 10.0,),
              SearchField(onChanged: (query) {
                setState(() {
                  searchQuery=query;
                });
                context.read<ProductDetailBloc>().add(SearchProductEvent(query: query));
              },),
              const SizedBox(height: 10.0,),
              BlocBuilder<ProductDetailBloc,ProductDetailState>(
                bloc: _productBloc,
                  builder: (context, state) {
                  switch(state.runtimeType){
                    case ProductLoadingState:
                      return Center(
                        child: CircularProgressIndicator(),);
                    case ProductAddSuccessState:
                      return Center(
                        child: Text("Successfully added"),
                      );
                    case ProductSuccessState:
                      final successState=state as ProductSuccessState;
                      final productList=successState.productList;
                      if(searchQuery.isNotEmpty)
                        {
                          final searchedProducts=productList.map((e) => e.products.where((product) => product.title.toLowerCase().contains(searchQuery.toLowerCase()))).expand((element) => element).toList();
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: searchedProducts.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            padding: EdgeInsets.all(6.0),
                            itemBuilder: (context, index) {
                              final productDetail=searchedProducts[index];
                              return Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(15.0)),
                                    child: SingleChildScrollView(
                                      physics: NeverScrollableScrollPhysics(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                                height:100,
                                                width: 150,
                                                decoration: BoxDecoration(color: Color(0xffEEEDED),border: Border.all(color: Colors.grey)),
                                                child: Image.network(productDetail.thumbnail)),
                                            Text(productDetail.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0),textAlign: TextAlign.center,),
                                            Text("\$ ${productDetail.price.toString()}",style: TextStyle(fontSize: 10.0),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    final productId=productDetail.id;
                                    context.read<ProductDetailBloc>().add(GetIndividualProductEvent(id: productId));
                                    Navigator.push(context, MaterialPageRoute(builder:(context) => ProductDetailsPage()
                                    ),
                                    );
                                  },
                                ),
                              );
                            },);
                        }
                      else
                        {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: successState.productList.length,
                            itemBuilder: (context, outerIndex) {
                              final products=successState.productList[outerIndex];
                              return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: products.products.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                padding: EdgeInsets.all(6.0),
                                itemBuilder: (context, innerIndex) {
                                  final productDetail=products.products[innerIndex];
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(15.0)),
                                        child: SingleChildScrollView(
                                          physics: NeverScrollableScrollPhysics(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                    height:100,
                                                    width: 150,
                                                    decoration: BoxDecoration(color: Color(0xffEEEDED),border: Border.all(color: Colors.grey)),
                                                    child: Image.network(productDetail.thumbnail)),
                                                Text(productDetail.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0),textAlign: TextAlign.center,),
                                                Text("\$ ${productDetail.price.toString()}",style: TextStyle(fontSize: 10.0),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: (){
                                        final productId=productDetail.id;
                                        context.read<ProductDetailBloc>().add(GetIndividualProductEvent(id: productId));
                                        Navigator.push(context, MaterialPageRoute(builder:(context) => ProductDetailsPage()
                                        ),
                                        );
                                      },
                                    ),
                                  );
                                },);
                            },);
                        }
                    default: return Container();
                  }
                  },)
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _logoutUser()
  async {
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    _prefs.clear();
  }
}
