import 'package:flutter/material.dart';
class FirstList extends StatelessWidget {
  const FirstList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> listForListViewBuilder=[
      {
        'imagePath':'assets/images/flutter.png',
        'title':'Flutter',
        'dateT':[
          {
            'date':'2017',
            'time':'8:00'
          }
        ]
      },
      {
        'imagePath':'assets/images/android.png',
        'title':'Android Studio',
        'dateT':[
          {
            'date':'2010',
            'time':'10:00'
          }
        ]
      },
      {
        'imagePath':'assets/images/vs.png',
        'title':'Visual Studio Code',
        'dateT':[
          {
            'date':'200',
            'time':'12:30'
          }
        ]
      },
      {
        'imagePath':'assets/images/git.png',
        'title':'GitHub',
        'dateT':[
          {
            'date':'2003',
            'time':'6:00'
          }
        ]
      },
      {
        'imagePath':'assets/images/lab.png',
        'title':'Git Lab',
        'dateT':[
          {
            'date':'2005',
            'time':'13:00'
          }
        ]
      },
      {
        'imagePath':'assets/images/bit.png',
        'title':'BitBucket',
        'dateT':[
          {
            'date':'2006',
            'time':'15:00'
          }
        ]
      },
      {
        'imagePath':'assets/images/google.png',
        'title':'Google',
        'dateT':[
          {
            'date':'1995',
            'time':'1:00'
          }
        ]
      },
      {
        'imagePath':'assets/images/mac.png',
        'title':'MacBook',
        'dateT':[
          {
            'date':'2006',
            'time':'9:00'
          }
        ]
      },
      {
        'imagePath':'assets/images/dell.png',
        'title':'Dell Laptop',
        'dateT':[
          {
            'date':'1998',
            'time':'3:00'
          }
        ]
      },
      {
        'imagePath':'assets/images/acer.png',
        'title':'Acer Laptop',
        'dateT':[
          {
            'date':'2000',
            'time':'6:00'
          }
        ]
      },
    ];
    return SizedBox(
      width: 600,
      child: ListView.builder(
          itemCount: listForListViewBuilder.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
          Map<String,dynamic> lists=listForListViewBuilder[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 220,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                  height: 120,
                  child: Image.asset(lists['imagePath']),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lists['title']),
                      const SizedBox(width: 20,),
                      Column(
                        children: [
                          Text("Date: ${lists['dateT'][0]['date']}"),
                          Text("Time: ${lists['dateT'][0]['time']}"),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        ),
    );
  }
}
