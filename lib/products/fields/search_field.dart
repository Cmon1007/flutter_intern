import 'package:flutter/material.dart';
class SearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const SearchField({
    required this.onChanged,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0),borderSide: BorderSide(color: Colors.black)),
          filled: true,
          fillColor: Color(0xffF3F4F5),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.search,size: 30,color: Colors.black,),
          ),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0),borderSide: BorderSide(color: Colors.black)),
        ),
    );
  }
}
