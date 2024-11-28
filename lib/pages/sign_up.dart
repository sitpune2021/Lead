import 'package:bizbooster/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constant.dart';
import '../widgets/my_header.dart';

class Registerr extends StatefulWidget {
  const Registerr({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Registerr> {
  final controller = ScrollController();
  double offset = 0;
  bool passwordInvisible = true;
  bool confirmPasswordInvisible = true;

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
              image: "assets/images/barbecue.svg",
              textTop: "Welcome to",
              textBottom: "Register",
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.h),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontFamily: "Poppins-Bold",
                      letterSpacing: .6,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text("Username",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: ScreenUtil().setSp(26))),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your username",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0)),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(30)),
                  Text("Email",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: ScreenUtil().setSp(26))),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0)),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(30)),
                  Text("Password",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: ScreenUtil().setSp(26))),
                  TextFormField(
                    obscureText: passwordInvisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordInvisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordInvisible = !passwordInvisible;
                            });
                          },
                        ),
                        hintText: "**********",
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontSize: 12.0)),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(30)),
                  Text("Confirm Password",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: ScreenUtil().setSp(26))),
                  TextFormField(
                    obscureText: confirmPasswordInvisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            confirmPasswordInvisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              confirmPasswordInvisible =
                                  !confirmPasswordInvisible;
                            });
                          },
                        ),
                        hintText: "**********",
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontSize: 12.0)),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(35)),
                  InkWell(
                    child: Container(
                      width: 330.w,
                      height: 100.h,
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
                          onTap: () {},
                          child: Center(
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins-Bold",
                                fontSize: 18.sp,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(0xFF5d74e3),
                            fontFamily: "Poppins-Bold",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
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
}
