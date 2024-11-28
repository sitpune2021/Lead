import 'dart:convert';
import 'package:bizbooster/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bizbooster/screens/sign_up/components/already_have_an_account_acheck.dart';
import 'package:bizbooster/utils/constant.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture user inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Future<bool> registerUser(
  //     String username, String password, String email, String mobileno) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("http://43.205.22.150:5000/user/createUser"),
  //       body: jsonEncode(<String, dynamic>{
  //         'name': username,
  //         'email': email,
  //         'mobileno': mobileno,
  //         'password': password,
  //       }),
  //     );

  //     print(response);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final jsonResponse = jsonDecode(response.body);
  //       print("Registration successful: $jsonResponse");
  //       return true;
  //     } else {
  //       print('Registration failed with status code: ${response.statusCode}');
  //       return false;
  //     }
  //   } catch (e) {
  //     print('An error occurred: ${e.toString()}');
  //     return false;
  //   }
  // }

  Future<bool> registerUser(
      String username, String password, String email, String mobileno) async {
    try {
      String API_BASE_URL = "http://43.205.22.150:5000/user/createUser";
      final response = await http.post(
        Uri.parse(API_BASE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'name': username,
          'email': email,
          'mobileno': mobileno,
          'password': password, // Passing password as last name here
        }),
      );

      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        print("Registration successful: $jsonResponse");
        bool authResult = await AuthService().createAuth(
          username,
          password,
          email,
          mobileno,
        );

        if (authResult) {
          // Create Auth API call was successful
          return true; // Return true if both registration and authentication were successful
        } else {
          print("Authentication failed after registration");
          return false; // Return false if authentication failed
        }
      } else {
        print('Registration failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.person),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _mobileController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              cursorColor: const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "Mobile",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.phone),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your mobile number';
                } else if (value.length < 10 || value.length > 10) {
                  return 'Please enter 10 digits';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.email),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }

                // Email validation regular expression
                String pattern = r'^[a-zA-Z0-9._%+-]+@[a-z]+\.[a-zA-Z]{2,}$';
                RegExp regex = RegExp(pattern);

                if (!regex.hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              cursorColor: const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }

                // Check password length
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }

                return null;
              },
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                // Call the registerUser function with input data
                bool success = await registerUser(
                  _nameController.text,
                  _passwordController.text,
                  _emailController.text,
                  _mobileController.text,
                );

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration Successful')),
                  );
                  Navigator.pop(context); // Navigate back to login
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration Failed')),
                  );
                }
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
