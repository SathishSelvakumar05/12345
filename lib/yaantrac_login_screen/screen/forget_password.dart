import 'dart:ui';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import '../custom/text.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        primaryColors: [
          Colors.blue,
          Colors.white,
          Colors.white,
        ],
        secondaryColors: [
          Colors.white,
          Colors.blueAccent,
          Colors.lightBlueAccent,
        ],
        child: Center(
          child: Container(
            height: 500,
            width: 500,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage('assets/images/truck3.jpg'),
            //       fit: BoxFit.fill),
            // ),
            alignment: Alignment.center,
            child: Container(
              height: 450,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  //  alignment: Alignment.center,
                                  'assets/images/favicon256.png',
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                children: [
                                  TextUtil(
                                    text: "Yaantrac",
                                    weight: true,
                                    size: 20,
                                    color: Colors.blueAccent,
                                  ),
                                  TextUtil(
                                    text: "Login",
                                    weight: true,
                                    size: 25,
                                  ),
                                ],
                              )
                            ],
                          ),

                          const Spacer(),
                          TextUtil(
                            text: "Forget Password",
                            size: 20,
                            weight: true,
                          ),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),

                          GestureDetector(
                            onTap: () {
                              print('Irunga bhaii');
                            },
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              alignment: Alignment.center,
                              child: TextUtil(
                                text: "Log In",
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          // const Spacer(),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
