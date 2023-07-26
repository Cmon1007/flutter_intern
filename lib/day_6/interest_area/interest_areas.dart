import 'package:flutter/material.dart';
class InterestArea extends StatefulWidget {
  final Function(List<String>) onInterestArea;
  const InterestArea({
    required this.onInterestArea,
    Key? key}) : super(key: key);

  @override
  State<InterestArea> createState() => _InterestAreaState();
}

class _InterestAreaState extends State<InterestArea> {
  List<Map<String,dynamic>> availableArea=[
    {
      'name':'Mobile Application',
      'isChecked':false,
    },
    {
      'name':'Web Development',
      'isChecked':false,
    },
    {
      'name':'UI/UX',
      'isChecked':false,
    },
    {
      'name':'QA',
      'isChecked':false,
    },
    {
      'name':'AI',
      'isChecked':false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Interest Areas"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: availableArea.map((areas){
                  return Row(
                      children:[
                        Checkbox(
                          activeColor: Colors.purple,
                          value: areas['isChecked'],
                          onChanged: (newValue) {
                            setState(() {
                              areas['isChecked'] = newValue;
                              final selectedInterestAreas=
                              availableArea.where((areas) => areas['isChecked']).map((areas) => areas['name']).toList().cast<String>();
                              widget.onInterestArea(selectedInterestAreas);
                            });
                          },
                        ),
                        Text(areas['name'])
                      ]
                  );
                }).toList(),
              ),
            ),
            //displaying selected value
            // Wrap(
            //   children: availableArea.map((areas) {
            //     if (areas["isChecked"] == true) {
            //       return Card(
            //         color: Colors.white38,
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(areas["name"]),
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
