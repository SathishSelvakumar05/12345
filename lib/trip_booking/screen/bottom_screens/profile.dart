import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_try/trip_booking/custom/bold_text.dart';
import 'package:new_try/trip_booking/custom/square_container.dart';

class ProfileScreen1 extends StatefulWidget {
  ProfileScreen1({super.key});

  @override
  State<ProfileScreen1> createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  int selectedIndex = 1;
  int GottenColor = 3;

  @override
  Widget build(BuildContext context) {
    int rating = GottenColor >= 5 ? GottenColor : 5;
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Container(
        color: Colors.blueGrey,
        child: Stack(
          children: [
            Positioned(
                right: 0,
                left: 0,
                //bottom: 0,
                top: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage('assets/images/default.jpg'),
                          fit: BoxFit.fill)),
                )),
            Positioned(
                top: 50, left: 20, child: Icon(Icons.monitor_weight_rounded)),
            Positioned(top: 50, right: 20, child: Icon(Icons.ac_unit_sharp)),
            Positioned(
                top: 270,
                bottom: 0,
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22),
                        topLeft: Radius.circular(22),
                      )),
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: 5, right: 15),
                          child: Row(
                            children: [
                              BoldText(
                                txt: 'DATA YAAN',
                                color: Colors.purple,
                                size: 25,
                              ),
                              Spacer(),
                              BoldText(
                                txt: "\$ 200",
                                size: 26,
                              )
                            ],
                          ),
                        ),
                        Container(
                          //  margin: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Icon(Icons.location_pin),
                              BoldText(
                                txt: 'INDIA ,  TAMILNADU',
                                size: 18,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(
                              5,
                              (index) {
                                return Icon(
                                  Icons.star,
                                  color: index <= GottenColor
                                      ? Colors.yellow
                                      : Colors.grey,
                                );
                              },
                            )),
                            SizedBox(
                              width: 8,
                            ),
                            BoldText(
                              txt: ('$GottenColor'),
                              size: 18,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BoldText(
                          txt: 'FLUTTER',
                          size: 18,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BoldText(
                          txt: 'WELCOME TO FLUTTER TEAM',
                          color: Colors.grey,
                          size: 14,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  print('$index');
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        print(
                                            'selected index is $selectedIndex');
                                      });
                                    },
                                    child: Container(
                                      child: SquareContainer(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        bgcolor: selectedIndex == index
                                            ? Colors.black
                                            : Colors.white,
                                        bordercolor: Colors.greenAccent,
                                        txt: (index + 1).toString(),
                                        //  IsIcon: true,
                                        // icon: Icons.add,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        BoldText(
                          txt: 'DATA YAAN',
                          size: 18,
                        ),
                        Flexible(
                          child: BoldText(
                              size: 10,
                              color: Colors.grey,
                              txt:
                                  'Datayaan Solutions Private Limited is a niche IT Services and products company in MEPZ-SEZ, Chennai, India. We are dedicated to revolutionizing the technology'),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
