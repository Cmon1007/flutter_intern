import 'package:e_commerce/widgets/payment_widget.dart';
import 'package:flutter/material.dart';
class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Payment Option"),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: InkWell(child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
          onTap: ()=>Navigator.of(context).pop(),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            PaymentWidget(
              title: 'Esewa',
              image: 'assets/images/esewa.png',
            ),
            PaymentWidget(title: 'Khalti', image: 'assets/images/khalti.png'),
            PaymentWidget(title: 'Visa', image: 'assets/images/visa.png'),
            PaymentWidget(title: 'Google Pay', image: 'assets/images/gpay.png'),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),fixedSize: Size(350, 55)),
              onPressed: (){
                showDialog(context: context,
                  builder: (context) => AlertDialog(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Error",style: TextStyle(fontSize: 20.0),),
                        Icon(Icons.error_outline,color: Colors.red,size: 40,),
                        Text("Please select any one payment method",textAlign: TextAlign.center,),
                      ],
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                  ),);
              }, child: Text("Confirm"),
            )
          ],
        ),
      ),
    );
  }
}
