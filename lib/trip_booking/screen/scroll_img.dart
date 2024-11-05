import 'package:flutter/material.dart';
import 'package:info_popup/info_popup.dart';
import 'package:new_try/trip_booking/custom/button.dart';

import '../custom/bold_text.dart';
import '../custom/normal_txt.dart';
import 'bottom_screen.dart';

class ScrollImg extends StatefulWidget {
  const ScrollImg({super.key});

  @override
  State<ScrollImg> createState() => _ScrollImgState();
}

class _ScrollImgState extends State<ScrollImg> {
  List ImagesList = [
    'images/air.jpg',
    'images/default.jpg',
    'images/water.jpg',
    'images/streetlight.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('App Title'),
        actions: [
          Text('Help'),
          IconButton(
            onPressed: () {
              showDialog(
                barrierColor: Color(0x01000000),
                context: context,
                builder: (BuildContext context) {
                  return Transform.translate(
                    offset: Offset(
                        40, -263), // Adjust the offset to change position
                    child: AlertDialog(
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: Colors.white60,
                      shape: Border(),
                      //title: Text("Custom Position"),
                      content: Text(
                          "This is a help section explaining how to use the app. You can provide instructions here."),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.help_outline),
          ),
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: ImagesList.length,
        itemBuilder: (context, Mainindex) {
          // final images = Images[index];
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesList[Mainindex]),
                    fit: BoxFit.cover)),
            child: Container(
              margin: EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        txt: 'DATA YAAN',
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      NormalText(
                        txt: 'Welcom Sathish Kumar',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: NormalText(
                          size: 14,
                          txt:
                              'Lets Try All If this ....Welcome Back to Our Trip ...Its Time For Try Your Own .....',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (
                                context,
                              ) =>
                                  BottomNavigationScreen(),
                            ));
                          },
                          child: Button()),
                    ],
                  ),
                  Column(
                      children: List.generate(
                    4,
                    (Sideindex) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: Mainindex == Sideindex ? 30 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Mainindex == Sideindex
                                ? Colors.pink.shade700
                                : Colors.purple.withOpacity(0.44)),
                      );
                    },
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
