import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:nb_utils/nb_utils.dart';
// import '../utils/T14Colors.dart';
// import '../utils/T14Images.dart';
// import '../utils/T14Strings.dart';
// import '../utils/T14Widget.dart';

class T14SignInScreen extends StatefulWidget {
  @override
  _T14SignInScreenState createState() => _T14SignInScreenState();
}

class _T14SignInScreenState extends State<T14SignInScreen> {
  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Yaantrac', style: TextStyle(fontSize: 20)),
              Text("Login", style: TextStyle(fontSize: 16)),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              height: 222,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  color: Colors.white),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: emailCon,
                        //  textFieldType: TextFieldType.EMAIL,
                        //textStyle: TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                          labelText: "t14_lbl_email",
                          labelStyle: TextStyle(color: CupertinoColors.black),
                          hintStyle: TextStyle(fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      TextField(
                        controller: passwordCon,
                        // textFieldType: TextFieldType.PASSWORD,
                        decoration: InputDecoration(
                          labelText: "t14_lbl_password",
                          labelStyle: TextStyle(color: CupertinoColors.black),
                          hintStyle: TextStyle(fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      Text("t14_lbl_ForgotPassword",
                          style: TextStyle(fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 80,
                              height: 1,
                              color: Colors.blue,
                              margin: EdgeInsets.only(right: 10)),
                          Text('or', style: TextStyle(color: Colors.red)),
                          Container(
                              width: 80,
                              height: 1,
                              color: Colors.orangeAccent,
                              margin: EdgeInsets.only(left: 10)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 130,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            child: Image.asset('assets/images/favicon256.png',
                                height: 20, width: 20),
                          ),
                          Container(
                            width: 130,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            child: Image.asset('assets/images/favicon256.png',
                                height: 20, width: 20),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Column(
                  //   children: [
                  //     t14AppButton(
                  //       context,
                  //       btnText: t14_lbl_SignIn,
                  //       bgColor: t14_SignInBgColor,
                  //       width: context.width(),
                  //       shape: 10.0,
                  //       txtColor: t14_colorSkyBlue,
                  //     ).paddingSymmetric(horizontal: 16),
                  //     16.height,
                  //     Text.rich(
                  //       TextSpan(
                  //         text: t14_lbl_DonAct,
                  //         style: secondaryTextStyle(),
                  //         children: <TextSpan>[TextSpan(text: t14_lbl_SignUp, style: boldTextStyle(color: t14_colorSkyBlue))],
                  //       ),
                  //     ).center(),
                  //     16.height,
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
