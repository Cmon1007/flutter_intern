import 'package:e_commerce/widgets/payment_widget.dart';
import 'package:flutter/material.dart';
class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Payment"),
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
            PaymentWidget(title: 'Khalti', image: 'assets/images/khalti.png')
          ],
        ),
      ),
    );
  }
}
