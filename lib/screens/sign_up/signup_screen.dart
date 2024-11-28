import 'package:bizbooster/screens/sign_up/components/background.dart';
import 'package:bizbooster/screens/sign_up/components/responsive.dart';
import 'package:bizbooster/screens/sign_up/components/sign_up_top_image.dart';
import 'package:bizbooster/screens/sign_up/components/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset:
          true, // Ensures the screen resizes when the keyboard appears
      body: Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: MobileSignupScreen(),
            desktop: Row(
              children: [
                Expanded(
                  child: SignUpScreenTopImage(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: SignUpForm(),
                      ),
                      SizedBox(height: 16.0 / 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SignUpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
