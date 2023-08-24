import 'package:e_commerce/widgets/payment_log.dart';
import 'package:flutter/material.dart';
class PaymentWidget extends StatelessWidget {
  final String title;
  final String image;
  const PaymentWidget({
    required this.title,
    required this.image,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        child: Container(
          height: 60,
          decoration: BoxDecoration(color: Color(0xffE8E2E2),borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            children: [
              Container(
                  width:120,
                  child: Image.asset(image,height: 50,width: 80,)),
              const SizedBox(width: 20.0,),
              Text(title,style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentLog(),)),
      ),
    );
  }
}
