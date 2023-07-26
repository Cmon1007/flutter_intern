import 'package:flutter/material.dart';
class LanguageField extends StatefulWidget {
  final Function(List<String>) onLanguagesChanged;
  const LanguageField({
    required this.onLanguagesChanged,
    Key? key}) : super(key: key);

  @override
  State<LanguageField> createState() => _LanguageFieldState();
}

class _LanguageFieldState extends State<LanguageField> {
  List<Map<String,dynamic>> availableLanguage=[
    {
      'name':'English',
      'isChecked':false,
    },
    {
      'name':'Nepali',
      'isChecked':false,
    },
    {
      'name':'Spanish',
      'isChecked':false,
    },
    {
      'name':'Hindi',
      'isChecked':false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0,right: 4.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Languages"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: availableLanguage.map((language){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Checkbox(
                          activeColor: Colors.purple,
                          value: language['isChecked'],
                          onChanged: (newValue) {
                            setState(() {
                              language['isChecked'] = newValue;
                              final selectedLanguages=
                              availableLanguage.where((language) => language['isChecked']).map((language) => language['name']).toList().cast<String>();
                              widget.onLanguagesChanged(selectedLanguages);
                            });
                          },
                        ),
                        Text(language['name'])
                      ]
                  );
                }).toList(),
              ),
            ),
            //displaying selected value
            // Wrap(
            //   children: availableLanguage.map((language) {
            //     if (language["isChecked"] == true) {
            //       return Card(
            //         color: Colors.white38,
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(language["name"]),
            //         ),
            //       );
            //     }
            //     return Container();
            //   }).toList(),
            // ),

          ],
        ),
        ),
      );
  }
}
