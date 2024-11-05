import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:new_try/yaantrac_login_screen/screen/login_screen.dart';

class Miscellaneous_4 extends StatefulWidget {
  @override
  _Miscellaneous_4State createState() => _Miscellaneous_4State();
}

class _Miscellaneous_4State extends State<Miscellaneous_4> {
  LiquidController liquid = LiquidController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final pages = [
      // Page 1
      Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.green,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: Column(
                children: [
                  Text(
                    "How We Use Your Information",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Providing and maintaining our fleet management services. Communicating with you, including sending updates, notifications, and support messages. Improving our services and developing new features based on user feedback. Enhancing user experience by personalizing content and recommendations. Ensuring the security and integrity of our platform.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Page 2
      Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: Column(
                children: [
                  Text(
                    "This is onboarding screen to discuss the employees to project planning.",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'By using Yaantrac, you confirm that you are of legal age in your jurisdiction to consent to the collection and use of personal information. If you are under the age of consent, you must obtain parental or guardian consent before using our services. Changes to This Privacy Policy right to update or modify this Privacy Policy at any time. Any changes will be effective upon posting.',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Page 3
      Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: Column(
                children: [
                  Text(
                    "Third-Party Services",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Yaantrac may integrate with third-party services to enhance functionality. These third-party services, such as Google Maps and vehicle tracking systems, may collect and process your information under their respective privacy policies.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Page 4
      Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: Column(
                children: [
                  Text(
                    "Welcome to the final onboard screen, let's start the journey!",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Yaantrac may integrate with third-party services to enhance functionality. These third-party services, such as Google Maps and vehicle tracking systems, may collect and process your information under their respective privacy policies.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          LiquidSwipe(
            pages: pages,
            waveType: WaveType.circularReveal,
            initialPage: index,
            liquidController: liquid,
            enableLoop: false,
            onPageChangeCallback: (val) {
              setState(() {
                index = val;
              });
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Visibility(
                  visible: index > 0,
                  child: InkWell(
                    onTap: () {
                      if (index > 0) {
                        liquid.animateToPage(page: index - 1);
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "Prev",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Next Button
                InkWell(
                  onTap: () {
                    if (index < pages.length - 1) {
                      liquid.animateToPage(page: index + 1);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YaantracLoginScreen()),
                      );
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildNavigationButton({
  //   required IconData icon,
  //   required String label,
  //   required VoidCallback onPressed,
  // }) {
  //   return InkWell(
  //     onTap: onPressed,
  //     child: Container(
  //       width: 100,
  //       height: 50,
  //       decoration: BoxDecoration(
  //         color: Colors.red,
  //         borderRadius: BorderRadius.circular(30),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(icon, color: Colors.white),
  //           SizedBox(width: 5),
  //           Text(
  //             label,
  //             style: TextStyle(
  //                 fontSize: 14,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.w500),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

//jojsw
// class Miscellaneous_4 extends StatefulWidget {
//   @override
//   _Miscellaneous_4State createState() => _Miscellaneous_4State();
// }
//
// class _Miscellaneous_4State extends State<Miscellaneous_4> {
//   LiquidController liquidController = LiquidController();
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (BuildContext context, BoxConstraints view) {
//       final pages = [
//         // Page 3
//         Container(
//           width: view.maxWidth,
//           height: view.maxHeight,
//           color: Colors.green,
//           alignment: AlignmentDirectional.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Image.asset('assets/images/water.jpg',
//               //     width: view.maxWidth, height: 500),
//               Container(
//                 width: 250,
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         "How We Use Your Information",
//                         maxLines: 3,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                           'Providing and maintaining our fleet management services.Communicating with you, including sending updates, notifications, and support messagesImproving our services and developing new features based on user feedback.Enhancing user experience by personalizing content and recommendations.Ensuring the security and integrity of our platform.')
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // Page 1
//         Container(
//           width: view.maxWidth,
//           height: view.maxHeight,
//           color: Colors.black,
//           alignment: AlignmentDirectional.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Image.asset('assets/images/water.jpg',
//               //     width: view.maxWidth, height: 500),
//               Container(
//                 width: 250,
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         "This is onboarding screen to discuss the employees to project planning.",
//                         maxLines: 3,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                         'By using Yaantrac, you confirm that you are of legal age in your jurisdiction to consent to the collection and use of personal information. If you are under the age of consent, you must obtain parental or guardian consent before using our services.Changes to This Privacy Policright to update or modify this Privacy Policy at any time. Any changes will be effective upon posting.',
//                         style: TextStyle(color: Colors.white),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // Page 2
//         Container(
//           width: view.maxWidth,
//           height: view.maxHeight,
//           color: Colors.white,
//           alignment: AlignmentDirectional.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Image.asset('assets/images/water.jpg',
//               //     width: view.maxWidth, height: 500),
//               Container(
//                 width: 250,
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         "Third-Party Services",
//                         maxLines: 3,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                           'Yaantrac may integrate with third-party services to enhance functionality. These third-party services, such as Google Maps and vehicle tracking systems, may collect and process your information under their respective privacy policies.')
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         // Page 4 (New Page)
//         Container(
//           width: view.maxWidth,
//           height: view.maxHeight,
//           color: Colors.blue,
//           alignment: AlignmentDirectional.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Image.asset('assets/images/water.jpg',
//               //     width: view.maxWidth, height: 500),
//               Container(
//                 width: 250,
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         "Welcome to the final onbstart the journey!",
//                         maxLines: 3,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                           'Yaantrac may integrate with third-party services to enhance functionality. These third-party services, such as Google Maps and vehicle tracking systems, may collect and process your information under their respective privacy policies.')
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ];
//
//       return Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           alignment: AlignmentDirectional.bottomCenter,
//           children: [
//             LiquidSwipe(
//               pages: pages,
//               waveType: WaveType.circularReveal,
//               initialPage: index,
//               liquidController: liquidController,
//               fullTransitionValue: view.maxHeight / 2,
//               enableLoop: false, // Set to false to prevent looping back
//               onPageChangeCallback: (val) {
//                 setState(() {
//                   index = val;
//                 });
//               },
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               alignment: AlignmentDirectional.bottomCenter,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   // Previous Button, only shown when index > 0
//                   Visibility(
//                     visible: index > 0,
//                     child: InkWell(
//                       onTap: () {
//                         if (index > 0) {
//                           liquidController.animateToPage(page: index - 1);
//                         }
//                       },
//                       child: Container(
//                         width: 100,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.arrow_back, color: Colors.white),
//                             SizedBox(width: 5),
//                             Text(
//                               "Prev",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Next Button
//                   InkWell(
//                     onTap: () {
//                       if (index < 3) {
//                         liquidController.animateToPage(page: index + 1);
//                       } else {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => YaantracLoginScreen()),
//                         );
//                       }
//                     },
//                     child: Container(
//                       width: 100,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Next",
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           SizedBox(width: 5),
//                           Icon(Icons.arrow_forward, color: Colors.white),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
