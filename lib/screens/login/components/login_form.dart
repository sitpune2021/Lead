import 'package:bizbooster/pages/dashboard.dart';
import 'package:bizbooster/screens/sign_up/components/already_have_an_account_acheck.dart';
import 'package:bizbooster/screens/sign_up/signup_screen.dart';
import 'package:bizbooster/services/auth_services.dart';
import 'package:bizbooster/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class LoginForm extends StatelessWidget {
//   const LoginForm({
//     Key? key,
//   }) : super(key: key);
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              // Show progress indicator dialog
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Disable dismissing by tapping outside
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );

              bool result = await AuthService().login(
                  emailController.text.toString(),
                  passwordController.text.toString());

              // Hide progress indicator
              Navigator.of(context).pop();

              if (result) {
// Show success toast
                Fluttertoast.showToast(
                  msg: "Login successful",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                );

                // Delay navigation slightly to allow the toast to appear
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          const DashboardPage(title: "App Name"),
                    ),
                  );
                });
              } else {
                // Show error dialog if login fails
                showLoginFailedDialog();
              }
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future showdialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Waiting for Server'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => const DashboardPage(
                //         title:
                //             "App Name"), // No need for `const` if Register has no const constructor
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showLoginFailedDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text(
              'Unable to log in. Please check your credentials or try again later.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
