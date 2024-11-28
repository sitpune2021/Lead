import 'package:flutter/material.dart';

class Ffaqs extends StatefulWidget {
  const Ffaqs({Key? key}) : super(key: key);

  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Ffaqs> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(
          left: 8.0, right: 8.0, bottom: 8), // Adds outer margin to the Card
      elevation: 2, // Controls the shadow depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Matches image corner radius
      ),
      child: Container(
        width: double.maxFinite,
        // color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FAQs",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "List of FAQS might be long so this is dummy text\nFAQs description Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. r. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                // style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     SizedBox(
              //       height: 50,
              //       width: 150, // Set the height of the button
              //       child: ElevatedButton(
              //         onPressed: () {
              //           // Handle button press
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.green,
              //           // shape: RoundedRectangleBorder(
              //           //   borderRadius:
              //           //       BorderRadius.circular(10), // Rounded corners
              //           // ),
              //         ),
              //         child: const Text(
              //           "Add Lead",
              //           style: TextStyle(fontSize: 16, color: Colors.white),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 50,
              //       // Set the height of the button
              //       child: ElevatedButton(
              //         onPressed: () {
              //           // Handle button press
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.deepPurple,
              //           // shape: RoundedRectangleBorder(
              //           //   borderRadius:
              //           //       BorderRadius.circular(10), // Rounded corners
              //           // ),
              //         ),
              //         child: const Text(
              //           "Share to customer",
              //           style: TextStyle(fontSize: 16, color: Colors.white),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
