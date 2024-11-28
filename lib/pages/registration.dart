import 'package:bizbooster/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.account_circle),
        //   color: Colors.white,
        //   iconSize: 35,
        // ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.switch_access_shortcut),
        //       iconSize: 30,
        //       color: Colors.white,
        //     ),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.notifications),
        //     iconSize: 30,
        //     color: Colors.white,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 150,
                      child: Icon(
                        Icons.person,
                        size: 100,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter first name'),
                      MinLengthValidator(3,
                          errorText: 'Minimum 3 characters required'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Enter first name',
                      labelText: 'First name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.lightBlue,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter last name'),
                      MinLengthValidator(3,
                          errorText:
                              'Last name should be at least 3 characters'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Enter last name',
                      labelText: 'Last name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.lightBlue,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter email address'),
                      EmailValidator(errorText: 'Enter a valid email address'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter mobile number'),
                      PatternValidator(r'^[0-9]{10}$',
                          errorText: 'Enter a valid mobile number'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                      labelText: 'Mobile',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.lightBlue,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print('Form submitted');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DashboardPage(title: "Dashboard")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                // const Center(
                //   child: Padding(
                //     padding: EdgeInsets.only(top: 20),
                //     child: Text(
                //       'Or Sign Up Using',
                //       style: TextStyle(fontSize: 18, color: Colors.black),
                //     ),
                //   ),
                // ),
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 20, left: 90),
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           height: 40,
                //           width: 40,
                //           child: Image.asset(
                //             'assets/google.png',
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //         Container(
                //           height: 70,
                //           width: 70,
                //           child: Image.asset(
                //             'assets/vishal.png',
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //         // Container(
                //         //   height: 40,
                //         //   width: 40,
                //         //   child: Image.asset(
                //         //     'assets/google.png',
                //         //     fit: BoxFit.cover,
                //         //   ),
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),
                // Center(
                //   child: Padding(
                //     padding: EdgeInsets.only(top: 60),
                //     child: Text(
                //       'SIGN IN',
                //       style:
                //           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
