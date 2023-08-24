import 'package:e_commerce/products/bloc/get_products_bloc/get_product_bloc.dart';
import 'package:e_commerce/products/cubit/navigatiom_cubit.dart';
import 'package:e_commerce/page/product_page.dart';
import 'package:e_commerce/page/user_page.dart';
import 'package:e_commerce/signin/sign_in_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_page.dart';
import 'order_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final ProductDetailBloc _bloc=ProductDetailBloc();
final AuthBloc _authBloc=AuthBloc();
  List<Widget> _selectedWidget = [
    ProductPage(),
    CartPage(),
    OrderHistory(),
  ];
  @override
  void initState() {
    _bloc.add(GetProductDetailEvent());
    SharedPreferences.getInstance().then((_prefs){
      String? token=_prefs.getString('token');
      if(token!=null && token.isNotEmpty)
        {
          _authBloc.add(GetUserDetailsEvent(token: token));
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.black,
          //   onPressed: (){
          //     _bloc.add(AddNewProductEvent());
          // },
          // child: Icon(Icons.add,color: Colors.white,),),
          body: Center(
            child: _selectedWidget.elementAt(state),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dynamic_feed_sharp, size: 30,),
                label: "Products",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 30,),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history, size: 30,),
                label: "History",
              ),
            ],
            // type: BottomNavigationBarType.shifting,
            currentIndex: state,
            onTap: _onTapChangeTab,
            elevation: 5,
            backgroundColor: Color(0xffEDEDED),
            selectedItemColor: Color(0xff2B2730),
            unselectedItemColor: Color(0xff18122B),
            showSelectedLabels: true,
            selectedIconTheme: IconThemeData(color: Color(0xff4F98CA)),
          ),
        );
      },
    );
  }

  void _onTapChangeTab(int index) {
    BlocProvider.of<NavigationCubit>(context).onChnage(index);
  }
}
