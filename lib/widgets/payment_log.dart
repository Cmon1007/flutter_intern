import 'package:e_commerce/page/cart_page.dart';
import 'package:e_commerce/page/home_page.dart';
import 'package:e_commerce/page/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PaymentLog extends StatefulWidget {
  const PaymentLog({Key? key}) : super(key: key);

  @override
  State<PaymentLog> createState() => _PaymentLogState();
}

class _PaymentLogState extends State<PaymentLog> {
  TextEditingController numberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool _isObscured=true;
  GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
        onTap: ()=>Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Phone Number",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15.0),),
          const SizedBox(height: 10.0,),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: numberController,
            validator: (value)
            {
              if(value==null||value.isEmpty)
              {
                return "Please enter your wallet number";
              }
              else if(!RegExp(r"^[0-9]+$").hasMatch(value))
              {
                return "Phone number cannot be a text or symbol";
              }
            },
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.phone,color: Colors.white,),
                hintText: "Your Wallet Phone Number",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(18.0),
                ),
                filled: true,
                fillColor: Colors.grey
            ),
          ),
              const SizedBox(height: 10.0,),
              Text("Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15.0),),
              const SizedBox(height: 10.0,),
              TextFormField(

                controller: passwordController,
                validator: (value)
                {
                  if(value==null||value.isEmpty)
                  {
                    return "Please enter password";
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: _isObscured?Icon(Icons.visibility_off,color: Colors.white,):Icon(Icons.visibility,color: Colors.white,),
                      onTap: (){
                        setState(() {
                          _isObscured=!_isObscured;
                        });
                      },
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(18.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey
                ),
                obscureText: _isObscured,
                obscuringCharacter: "*",
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),fixedSize: Size(350, 55)),
                onPressed: () {
                  if(_formKey.currentState!.validate())
                    {
                    //   showDialog(context: context,
                    //     builder: (context) => AlertDialog(
                    //       title: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 60),
                    //             child: Text("Thank You",style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
                    //           ),
                    //           const SizedBox(width: 50.0,),
                    //           Icon(Icons.check_circle_outline,color: Colors.green,size: 40,),
                    //           Text("Your purchase has been successfull",textAlign: TextAlign.center,),
                    //         ],
                    //       ),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                    //
                    //     ),);
                      removeItem();
                      numberController.clear();
                      passwordController.clear();
                      Get.to(HomePage());
                      Get.showSnackbar(GetSnackBar(titleText:Text( "Thank You",style: TextStyle(color: Colors.black),),
                      messageText: Text("Your Purchase has beeen Successful",style: TextStyle(color: Colors.black),),
                        snackPosition: SnackPosition.TOP,duration: Duration(seconds: 3),
                        backgroundColor: Colors.white,
                          borderColor: Colors.orangeAccent,
                      ));
                    }
                }, child: Text("Confirm Order"),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> removeItem()
  async {
    SharedPreferences _prefs= await SharedPreferences.getInstance();
    _prefs.remove('cart');
  }
}
