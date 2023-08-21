import 'package:e_commerce/page/sign_in_page.dart';
import 'package:e_commerce/products/cubit/navigatiom_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../signin/sign_in_bloc/auth_bloc.dart';
class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {@override

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
          centerTitle: true,
          backgroundColor: Color(0xffACB1D6),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                  child: Icon(Icons.logout,size: 35,color: Colors.black,),
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
              ),
            )
          ],
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
        onTap: _goBack,
        ),
        ),
        body: Container(
          color: Color(0xffACB1D6),
          child: BlocBuilder<AuthBloc,AuthState>(builder: (context, state) {
            if(state is AuthLoadingState)
              {
                  return Center(child: CircularProgressIndicator(),);
              }
            else if(state is AuthFailureState){
              return Center(child: Text("No user available"),);
            }

            else if(state is AuthSuccessState)
              {
                final users=state.userData;
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Image.network(
                                      users.image, height: 160, width: 150))),
                        ],
                      ),
                      const SizedBox(height: 15.0,),
                      Container(
                        decoration: BoxDecoration(color: Color(0xffACB1D6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(users.username, style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Name: ${users.firstName}",
                                  style: TextStyle(fontSize: 18.0),),
                                Text(users.lastName,
                                  style: TextStyle(fontSize: 18.0),),
                              ],
                            ),
                            Text("Gender: ${users.gender}",
                              style: TextStyle(fontSize: 18.0),),
                            Text("Email: ${users.email}",
                              style: TextStyle(fontSize: 18.0),),
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              }
            else
              {
                return Container();
              }
    },),
        )
      ),
    );
  }

  Future<void> _logoutUser()
  async {
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    _prefs.clear();
  }
  Future<bool> _goBack() async
  {
    int currentTab =BlocProvider.of<NavigationCubit>(context).state;
    int newTab=currentTab-1>=0?currentTab-1:0;
    BlocProvider.of<NavigationCubit>(context).onChnage(newTab);
    return true;
  }
}
