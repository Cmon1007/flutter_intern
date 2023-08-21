import 'package:e_commerce/carts/bloc/cart_bloc.dart';
import 'package:e_commerce/page/home_page.dart';
import 'package:e_commerce/page/sign_in_page.dart';
import 'package:e_commerce/page/splash_page.dart';
import 'package:e_commerce/products/bloc/get_products_bloc/get_product_bloc.dart';
import 'package:e_commerce/products/cubit/navigatiom_cubit.dart';
import 'package:e_commerce/signin/model/user_auth_model.dart';
import 'package:e_commerce/signin/sign_in_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
        future: hasToken(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          else if(snapshot.hasError)
            {
              return Center(child: Text("Error getting token"),);
            }
          else
            {
              final bool userToken= snapshot.data ?? false;
              return MultiBlocProvider(
                providers: [
                BlocProvider<ProductDetailBloc>(create: (context) => ProductDetailBloc(),),
                BlocProvider<NavigationCubit>(create: (context) => NavigationCubit(),),
                BlocProvider<AuthBloc>(create: (context) => AuthBloc(),),
                  BlocProvider<CartBloc>(create: (context) => CartBloc(),),
              ],
                child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "E-Commerce",
                home: userToken?HomePage():SplashScreen(),
              ),);
            }
        },
      );
  }
  Future<bool> hasToken()
  async {
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    String? token=_prefs.getString('token');
    return token!=null && token.isNotEmpty;
  }
}
