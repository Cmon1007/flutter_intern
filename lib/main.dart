import 'package:flutter/material.dart';
import 'package:flutter_internn/day_6/cv_page.dart';
import 'package:flutter_internn/day_7/signup_form.dart';
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
      home: SignUpForm(),
    );
  }
}
