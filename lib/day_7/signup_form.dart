import 'package:flutter/material.dart';
import 'package:flutter_internn/day_7/dob.dart';
import 'package:flutter_internn/day_7/email_field.dart';
import 'package:flutter_internn/day_7/gender_field.dart';
import 'package:flutter_internn/day_7/marital_status.dart';
import 'package:flutter_internn/day_7/mobile_number.dart';
import 'package:flutter_internn/day_7/name_field.dart';
import 'package:flutter_internn/day_7/password_field.dart';
import 'package:flutter_internn/day_7/upload_image.dart';
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Form"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
              children: [
                  NameField(),
                  GenderField(),
                  DOB(),
                  MobileNumber(),
                  MaritalStatus(),
                  EmailField(),
                  PasswordField(),
                  ImageUploading(),
                  ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate())
              {
                  showDialog(context: context, builder: (context) => AlertDialog(title: Text("Successfully Registered"),
                  ),
                  );
              }

                  },
                      child: Text("Register"),
                  )
              ],
            ),
                )),
          ],
        ),
      ),
    );
  }
}
