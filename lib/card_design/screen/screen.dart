import 'package:flutter/material.dart';

import '../cystom_line/divider.dart';

class CardDesign extends StatelessWidget {
  const CardDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 340,
            child: Card(
              //  color: Colors.blueGrey.withOpacity(0.55),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Customer Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'Status: Active',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,
                          child: Icon(Icons.person, size: 30),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Container(
                          color: Colors.black,
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text('+91 9585394516')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.black,
                          child: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text('sathishselvakumar05@gmail.com')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.black,
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Flexible(
                          child: Text(
                              '7/118, Bharani Street Nallur-627853,tirunelveli twn,tamilnadu-90785635123'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Separetor(),
                    Row(
                      children: [
                        Container(
                            color: Colors.white,
                            child: Icon(
                              Icons.lock_clock_rounded,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Start Time - 15-july-2024',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.green),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Icon(
                            Icons.lock_clock_rounded,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'End Time  -  19-july-2024',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              // fontStyle: FontStyle.italic,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
