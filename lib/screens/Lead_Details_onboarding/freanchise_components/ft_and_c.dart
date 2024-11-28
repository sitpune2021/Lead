import 'package:flutter/material.dart';

class FtAndC extends StatefulWidget {
  const FtAndC({Key? key}) : super(key: key);

  @override
  _TAndCState createState() => _TAndCState();
}

class _TAndCState extends State<FtAndC> {
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
                "T&C",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "T&C description Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                // style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
