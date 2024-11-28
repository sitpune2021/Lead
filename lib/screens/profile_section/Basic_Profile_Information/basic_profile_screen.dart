import 'package:flutter/material.dart';

class BasicProfileScreen extends StatefulWidget {
  const BasicProfileScreen({super.key});

  @override
  State<BasicProfileScreen> createState() => _BasicProfileScreenState();
}

class _BasicProfileScreenState extends State<BasicProfileScreen> {
  // Controllers
  final TextEditingController nameController =
      TextEditingController(text: "Shivraj Patil");
  final TextEditingController emailController =
      TextEditingController(text: "shivraaj9696@gmail.com");
  final TextEditingController dobController =
      TextEditingController(text: "1992-03-14");
  final TextEditingController pincodeController =
      TextEditingController(text: "411028");
  final TextEditingController cityController =
      TextEditingController(text: "Pune");
  final TextEditingController educationController =
      TextEditingController(text: "Graduation");

  // Dropdown values
  String businessType = "Business Owner";
  String education = "Graduate";
  String income = "0–2 Lakhs/year";
  String gender = "Male";
  String state = "MAHARASHTRA";

  // Options for dropdowns
  final List<String> businessOptions = [
    "Business Owner",
    "Salaried",
    "Freelancer"
  ];
  // final List<String> educationOptions = [
  //   "Graduate",
  //   "Post-Graduate",
  //   "Undergraduate"
  // ];
  final List<String> incomeOptions = [
    "0–2 Lakhs/year",
    "2–5 Lakhs/year",
    "5+ Lakhs/year"
  ];
  final List<String> genderOptions = ["Male", "Female", "Other"];
  final List<String> stateOptions = [
    "MAHARASHTRA",
    "DELHI",
    "GUJARAT",
    "KARNATAKA"
  ];

  // Toggle value
  bool receiveUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Profile Information"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field (TextField) with label below the input box
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                      height: 4), // space between TextField and label
                  const Text(
                    "As mentioned on PAN Card", // label below the TextField
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Email Field (TextField) with label below the input box
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // space between TextField and label
                ],
              ),
              const SizedBox(height: 8),

              // Date of Birth Field (TextField) with label below the input box

              const SizedBox(height: 8),

              // Business Type Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                    value: businessType,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    items: businessOptions.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        businessType = value as String;
                      });
                    },
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              const SizedBox(height: 8),

              // Education Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    readOnly: true,
                    controller: educationController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xffBDBDBD),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // space between TextField and label
                ],
              ),
              const SizedBox(height: 8),

              // Income Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                    value: income,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    items: incomeOptions.map((range) {
                      return DropdownMenuItem(
                        value: range,
                        child: Text(range),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        income = value as String;
                      });
                    },
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              const SizedBox(height: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: dobController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true, // Enables background color
                      fillColor: Color(0xffBDBDBD),
                    ),
                    readOnly: true, // Ensures it cannot be typed into directly
                    style: TextStyle(
                      color: Colors.black, // Text color
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),

              const SizedBox(height: 8),
              // Gender Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                    value: gender,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Color(
                          0xffBDBDBD), // Background color for readonly effect
                      filled: true, // Applies the fill color
                    ),
                    items: genderOptions.map((g) {
                      return DropdownMenuItem(
                        value: g,
                        child: Text(g),
                      );
                    }).toList(),
                    onChanged:
                        null, // Setting onChanged to null makes it readonly
                  ),
                  const SizedBox(height: 4),
                ],
              ),

              const SizedBox(height: 8),

              // Pincode Field (TextField) with label below the input box
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: pincodeController,
                    decoration: const InputDecoration(
                      fillColor: Color(0xffBDBDBD),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              const SizedBox(height: 8),

              // City Field (TextField) with label below the input box
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: cityController,
                    readOnly: true, // Ensures it cannot be typed into directly
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true, // Enables background color
                      fillColor: Color(0xffBDBDBD),
                    ),
                    style: TextStyle(
                      color: Colors.black, // Set text color
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),

              const SizedBox(height: 8),

              // State Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                    value: state,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    items: stateOptions.map((s) {
                      return DropdownMenuItem(
                        value: s,
                        child: Text(s),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        state = value as String;
                      });
                    },
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              const SizedBox(height: 8),

              // Receive Updates Toggle in Card
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.telegram, color: Colors.green),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "Receive updates on 9309517500",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Switch(
                        value: receiveUpdates,
                        onChanged: (value) {
                          setState(() {
                            receiveUpdates = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Terms and Conditions in Card
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "By submitting, I agree to the GroMo ",
                      children: [
                        TextSpan(
                          text: "Terms & Conditions",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    padding: const EdgeInsets.symmetric(
                        vertical: 16), // Adjust padding if needed
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white), // Optional: Adjust font size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
