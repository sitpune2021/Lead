import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool passwordInvisible = true; // State for password visibility

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Text("Username",
                style: TextStyle(
                    fontFamily: "Poppins", fontSize: ScreenUtil().setSp(26))),
            const TextField(
              decoration: InputDecoration(
                  hintText: "eg: chromicle",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Text("Password",
                style: TextStyle(
                    fontFamily: "Poppins", fontSize: ScreenUtil().setSp(26))),
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
                        passwordInvisible =
                            !passwordInvisible; // Toggle visibility
                      });
                    },
                  ),
                  hintText: "**********",
                  hintStyle:
                      const TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
          ],
        ),
      ),
    );
  }
}
