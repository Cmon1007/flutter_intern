import 'package:flutter/material.dart';
class PaymentWidget extends StatefulWidget {
  final String title;
  final String image;
  const PaymentWidget({
    required this.title,
    required this.image,
    Key? key}) : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(color: Color(0xffE8E2E2),borderRadius: BorderRadius.circular(15.0)),
        child: InkWell(
          onTap: (){
            setState(() {
              isChecked=!isChecked;
            });
          },
          child: Row(
            children: [
              Image.asset(widget.image,height: 50,width: 90,),
              Text(widget.title,style: TextStyle(fontSize: 20),),
              Spacer(),
              Radio(
                value: isChecked,
                groupValue: true,
                onChanged: (value) {
              },)
            ],
          ),
        ),
      ),
    );
  }
}
