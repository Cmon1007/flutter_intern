import 'package:flutter/material.dart';

import 'day_one_screen.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Second day asssessment",
      home: DayOneScreen(),
    );
  }
}
