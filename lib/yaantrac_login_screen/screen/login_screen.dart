import 'dart:ui';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_try/yaantrac_login_screen/screen/policy_screen.dart';
import '../custom/text.dart';
import 'ForgotPasswordScreen.dart';
import 'PrivacyPolicyText.dart';
import 'TermsOfServiceText.dart';
import 'appbar_color.dart';
import 'forget_password.dart';

class YaantracLoginScreen extends StatefulWidget {
  const YaantracLoginScreen({super.key});
  @override
  State<YaantracLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<YaantracLoginScreen>
    with TickerProviderStateMixin {
  // bool _isChecked = false;
  bool _isObscure = true;

  bool _isChecked = false;
  bool _isObsecure = true;
  bool _loggedIn = false;
  bool _checkboxValue = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  double _buttonOpacity = 0.5;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CupertinoColors.activeBlue,
            Colors.white,
          ],
        ),
      ),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/images/truck3.jpg'),
      //         fit: BoxFit.cover)),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          //  height: 500,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30),
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
                          Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  //alignment: Alignment.center,
                                  'assets/images/favicon256.png',
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/yaantrac_name.png',
                                  height: 50.0,
                                  width: 100.0,
                                ),
                              ),
                              // TextUtil(
                              //   text: "Yaantrac",
                              //   weight: true,
                              //   size: 20,
                              //   color: Colors.white,
                              // ),
                              TextUtil(
                                text: "Login",
                                weight: true,
                                size: 17,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextUtil(
                        text: "Username",
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueAccent),
                                ),
                                // // labelText: 'Username',
                                // labelStyle: GoogleFonts.inter(
                                //     fontSize: 18, color: Colors.black),
                                // hintText: 'Enter the Username ',
                                //hintStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.person_2_outlined,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide: const BorderSide(
                                //       color: Colors.white, width: 2.0),
                                //   borderRadius: BorderRadius.circular(10.0),
                                // ),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10.0),
                                // ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the username';
                                } else if (value.length < 3 ||
                                    value.length > 30) {
                                  return 'Username must be between 3 to 30 characters';
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              onChanged: (value) {
                                //  _updateButtonOpacity();
                              },
                            ),
                            SizedBox(height: 30),
                            TextUtil(
                              text: "Password",
                            ),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueAccent),
                                ),
                                //  labelText: 'Password',
                                // labelStyle: GoogleFonts.inter(
                                //     fontSize: 18, color: Colors.black),
                                //   hintText: 'Enter the password',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  child: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide: const BorderSide(
                                //       color: Colors.white, width: 2.0),
                                //   borderRadius: BorderRadius.circular(10.0),
                                // ),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(
                                //     10.0,
                                //   ),
                                // ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the password';
                                } else if (value.length < 8 ||
                                    value.length > 16) {
                                  return 'Password must be 8 to 16 characters';
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              onChanged: (value) {
                                //   _updateButtonOpacity();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Forgot Password ?',
                                      style: GoogleFonts.inter(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //   SizedBox(height: 10),
                            Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Checkbox(
                                  value: _checkboxValue,
                                  activeColor: Colors.green,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _checkboxValue = value!;
                                      //   _updateButtonOpacity();
                                    });
                                  },
                                ),
                                Text(
                                  "I agree to the ",
                                  style: GoogleFonts.inter(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                InkWell(
                                  child: Text(
                                    "Privacy Policy ",
                                    style: GoogleFonts.inter(
                                      color: Colors.redAccent,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () async {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      // barrierColor: Colors.white38,
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(80),
                                              topLeft: Radius.circular(80))),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 400,
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: PrivacyPolicyText(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    /* Uri url = Uri.parse(
                                            "https://www.yaantrac.com/privacy-policy/");
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        }*/
                                  },
                                ),
                                InkWell(
                                  child: Text(
                                    "Terms & Conditions",
                                    style: GoogleFonts.inter(
                                      color: Colors.redAccent,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () async {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      // barrierColor: Colors.white38,
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(80),
                                              topLeft: Radius.circular(80))),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 400,
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: TermsOfServiceText(),
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    // Uri url = Uri.parse(
                                    //     "https://www.yaantrac.com/terms-and-conditions/");
                                    // if (await canLaunchUrl(url)) {
                                    //   await launchUrl(url);
                                    // }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            //  context.read<LoginCubit>().state.loginLoading!
                            //    ? CircularProgressIndicator()
                            //  : AnimatedOpacity(
                            //opacity: _buttonOpacity,
                            //duration: Duration(milliseconds: 500),
                            // child:

                            GestureDetector(
                              onTap: _emailController.text.isNotEmpty &&
                                      _passwordController.text.isNotEmpty &&
                                      _checkboxValue
                                  ? () {
                                      if (_formKey.currentState!.validate()) {
                                        print('valid');
                                        // loginFunction(context);
                                      }
                                    }
                                  : null,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    ));
  }
}
