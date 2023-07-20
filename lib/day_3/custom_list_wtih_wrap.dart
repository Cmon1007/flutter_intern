import 'package:flutter/material.dart';
class CustomListWithWrap extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomListWithWrap({
    required this.icon,
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(border: Border.all(color: Colors.deepOrangeAccent)),
        child: Wrap(
          spacing: 10.0,
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(text),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
