import 'package:e_commerce/page/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _showSplashScreen();
  }
  _showSplashScreen()
  {
    Future.delayed(Duration(seconds: 5),
        (){
      Get.offAll(SignInPage());
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash2.png"),
            Text("Ecommerce App",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
          ],
        ),
      ),
    );
  }
}
