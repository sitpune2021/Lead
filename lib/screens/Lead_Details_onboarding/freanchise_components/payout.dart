import 'package:flutter/material.dart';

class Payout extends StatefulWidget {
  const Payout({Key? key}) : super(key: key);

  @override
  _PayoutState createState() => _PayoutState();
}

class _PayoutState extends State<Payout> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 8,
          top: 8), // Adds outer margin to the Card
      elevation: 2, // Controls the shadow depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Matches image corner radius
      ),
      child: Container(
        width: double.maxFinite,
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Payout",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 16),
              _payoutcard(),
              const SizedBox(height: 16),
              const Text(
                "Payout description Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                textAlign: TextAlign.justify,
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _payoutcard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          'KIWI Yes Bank Rupay Credit Card ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Earn ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'upto ₹1,500',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Image.network(
                  'https://logos-world.net/wp-content/uploads/2020/11/Swiggy-Logo-700x394.png', // Replace with actual image URL
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
