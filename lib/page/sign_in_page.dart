import 'package:e_commerce/page/home_page.dart';
import 'package:e_commerce/signin/sign_in_bloc/auth_bloc.dart';
import 'package:e_commerce/signin_field/password_field.dart';
import 'package:e_commerce/signin_field/username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey=GlobalKey<FormState>();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
           showDialog(context: context, builder: (context) => AlertDialog(
             title: Column(
               children: [
                 Text("Loading"),
                 CircularProgressIndicator(),
               ],
             ),
           ),);
          }
          else if (state is AuthFailureState) {
            Navigator.of(context).pop();
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Column(
                children: [
                  Text(state.errorMessage),
                  Icon(Icons.error_outline,color: Colors.red,size: 30,),
                  const SizedBox(height: 10,),
                  MaterialButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Back",style: TextStyle(fontSize: 15),),
                  ),
                ],
              ),
            ),);
          }
          else if (state is AuthSuccessState) {
           Get.showSnackbar(GetSnackBar(
             title: "Success",
           duration: Duration(seconds: 2),
           message: "Login Success",
             snackPosition:SnackPosition.TOP,
           )
           );
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            usernameController.clear();
            passwordController.clear();
          }

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 342,
                            height: 250,
                            child: Image.asset("assets/images/commerce.png",),
                          ),
                        ],
                      ),
                      UserNameField(controller: usernameController),
                      PasswordField(controller: passwordController),
                      const SizedBox(height: 20.0,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            fixedSize: Size(330,60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0))),
                        onPressed: () {
                          if(_formKey.currentState!.validate())
                            {
                              context.read<AuthBloc>().add(SignInEvent(
                                  username: usernameController.text.trim(),
                                  password: passwordController.text.trim()));
                            }
                        },
                        child: Text("Login",style: TextStyle(fontSize: 20.0),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
