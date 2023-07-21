import 'package:flutter/material.dart';
class NavigatedPage extends StatelessWidget {
  const NavigatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> customScrollLists=[
      {
        'imagePath':'assets/images/flutter.png',
        'title':'Flutter',
      },
      {
        'imagePath':'assets/images/android.png',
        'title':'Android Studio',
      },
      {
        'imagePath':'assets/images/vs.png',
        'title':'Visual Studio Code',
      },
      {
        'imagePath':'assets/images/git.png',
        'title':'GitHub',
      },
      {
        'imagePath':'assets/images/lab.png',
        'title':'Git Lab',
      },
      {
        'imagePath':'assets/images/bit.png',
        'title':'BitBucket',

      },
      {
        'imagePath':'assets/images/google.png',
        'title':'Google',
      },
      {
        'imagePath':'assets/images/flutter.png',
        'title':'Flutter',
      },
      {
        'imagePath':'assets/images/android.png',
        'title':'Android Studio',
      },
      {
        'imagePath':'assets/images/vs.png',
        'title':'Visual Studio Code',
      },
      {
        'imagePath':'assets/images/git.png',
        'title':'GitHub',
      },
    ];
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 80,
              toolbarHeight: 50,
              title: Column(
                children: [
                  Text("Navigated Page"),
                  Icon(Icons.insert_page_break),
                ],
              ),
              elevation: 0,
              backgroundColor: Colors.black,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 2,
                    (context, index) {
                  return Container(
                    child: ListView.builder(
                      itemCount: customScrollLists.length,
                      primary: false,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        Map<String,dynamic> lists=customScrollLists[index];
                        return Container(
                          height: 110,
                          decoration: BoxDecoration(border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  height:80,
                                  child: Image.asset(lists['imagePath'],fit: BoxFit.contain,),
                              ),
                              Text(lists['title']),
                            ],
                          )
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
