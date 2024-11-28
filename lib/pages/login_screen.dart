import 'package:bizbooster/pages/dashboard.dart';
// import 'package:bizbooster/pages/registration.dart';
// import 'package:bizbooster/pages/sign_up.dart';
import 'package:bizbooster/screens/sign_up/signup_screen.dart';
import 'package:bizbooster/utils/constant.dart';

import 'package:bizbooster/widgets/LoginCard.dart';
import 'package:bizbooster/widgets/my_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final controller = ScrollController();
  double offset = 0;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(750, 1334), // Set your design size here
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/images/signup.svg",
              textTop: "",
              textBottom: "",
              offset: offset,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LoginCard(),
                    SizedBox(
                        height: 40.h), // Use ScreenUtil(). directly for height
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        //     const SizedBox(width: 12.0),
                        //     GestureDetector(
                        //       onTap: _radio,
                        //       child: radioButton(_isSelected),
                        //     ),
                        //     const SizedBox(width: 8.0),
                        //     Text(
                        //       "Remember me",
                        //       style: TextStyle(
                        //         fontSize: 12.sp, // Use ScreenUtil() for fontSize
                        //         fontFamily: "Poppins-Medium",
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        InkWell(
                          child: Container(
                            width: 330.w, // Use ScreenUtil(). for width
                            height: 100.h, // Use ScreenUtil(). for height
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: kActiveShadowColor,
                                  offset: const Offset(0.0, 8.0),
                                  blurRadius: 8.0,
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  print("alert");
                                  // Show the AlertDialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Login Failed'),
                                        content:
                                            const Text('Waiting for Server'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DashboardPage(
                                                          title:
                                                              "App Name"), // No need for `const` if Register has no const constructor
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    "SIGNIN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Bold",
                                      fontSize: 18
                                          .sp, // Use ScreenUtil() for fontSize
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     horizontalLine(),
                    //     Text(
                    //       "Social Login",
                    //       style: TextStyle(
                    //         fontSize: 16.sp, // Adjusted for screen size
                    //         fontFamily: "Poppins-Medium",
                    //       ),
                    //     ),
                    //     horizontalLine(),
                    //   ],
                    // ),
                    // SizedBox(height: 40.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     SocialIcon(
                    //       color: kFaceBookColor,
                    //       iconData: CustomIcons.facebook,
                    //       onPressed: () {},
                    //     ),
                    //     SocialIcon(
                    //       color: kGoogleColor,
                    //       iconData: CustomIcons.googlePlus,
                    //       onPressed: () {},
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "New User? ",
                          style: TextStyle(fontFamily: "Poppins-Medium"),
                        ),
                        InkWell(
                          onTap: () {
                            print("SignUp tapped");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()
                                  // const Registerr(), // No need for `const` if Register has no const constructor
                                  ),
                            );
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                              color: Color(0xFF5d74e3),
                              fontFamily: "Poppins-Bold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget horizontalLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 120.w, // Adjusted for screen size
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black),
        ),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}
