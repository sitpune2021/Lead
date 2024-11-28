import 'package:bizbooster/services/auth_services.dart';
import 'package:flutter/material.dart';

class SellerOnboarding extends StatefulWidget {
  const SellerOnboarding({super.key});

  @override
  _SellerOnboardingState createState() => _SellerOnboardingState();
}

class _SellerOnboardingState extends State<SellerOnboarding> {
  final _formKey = GlobalKey<FormState>();

  // Form field variables
  String? fullName;
  String? email;
  String? phoneNumber;
  String? pincode;
  String? businessName;
  String? businessType;
  String? businessAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Seller Onboarding"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Personal Information Section
                      const Text(
                        "Personal Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        cursorColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Full Name',
                          // helperText: 'Enter your first and last name',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          fullName = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        cursorColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email Address',
                          // helperText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        cursorColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          labelText: 'Phone Number',
                          // helperText: 'Enter your mobile number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          phoneNumber = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24.0),
                      // Business Information Section
                      const Text(
                        "Business Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        cursorColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.business),
                          labelText: 'Business Name',
                          // helperText: 'Enter your business name',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          businessName = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your business name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        cursorColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.category),
                          labelText: 'Business Type',
                          helperText: 'e.g., Sole Proprietorship, Partnership',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          businessType = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your business type';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        cursorColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.location_on),
                          labelText: 'Business Address',
                          // helperText: 'Enter your business address',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          businessAddress = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your business address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        cursorColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.location_on_outlined),
                          labelText: 'Pincode',
                          // helperText: 'Enter your mobile number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          pincode = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your pincode';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue[
                                    200]!), // Set the background color here
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Handle the form submission logic here
                              // print('Full Name: $fullName');
                              // print('Email: $email');
                              // print('Phone Number: $phoneNumber');

                              // print('Business Name: $businessName');
                              // print('Business Type: $businessType');
                              // print('Business Address: $businessAddress');
                              // print('pincode $pincode');

                              bool result = await AuthService().sellerOnboard(
                                  fullName!,
                                  email!,
                                  phoneNumber!,
                                  businessName!,
                                  businessType!,
                                  businessAddress!,
                                  pincode!);

                              if (result == true) {
                                // Clear the form fields
                                _formKey.currentState!.reset();

                                // Show success Snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Seller onboard successful"),
                                    backgroundColor: Colors.green,
                                    duration: Duration(
                                        seconds:
                                            2), // Customize the duration as needed
                                  ),
                                );
                              } else {
                                // Show failure Snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Failed to onboard seller. Please try again."),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // TextButton(
                      //   onPressed: () {
                      //     // Navigate to sign-in page
                      //   },
                      //   child: const Text('Already have an account? Sign in'),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
