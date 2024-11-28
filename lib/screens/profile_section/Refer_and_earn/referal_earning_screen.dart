import 'package:flutter/material.dart';

class ReferralNetworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral network'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Referral network balance
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Referral network',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₹0.0',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Warning message with extra right border
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: Colors.yellow[800]!,
                    width: 4.0, // Adjust the width as needed
                  ),
                  right: BorderSide(
                    color: Colors.yellow[800]!,
                    width: 1.0, // Adjust the width as needed
                  ),
                  top: BorderSide(
                    color: Colors.yellow[800]!,
                    width: 1.0, // Adjust the width as needed
                  ),
                  bottom: BorderSide(
                    color: Colors.yellow[800]!,
                    width: 1.0, // Adjust the width as needed
                  ),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.yellow[800]),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Any self sale, insurance sale, sale to existing GroMo Partner or any sale of Instant Deal products done by your referral will not be eligible for the referral earnings.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Referral list in a card (including header and items)
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            elevation: 4.0, // Set the elevation for shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // Referral list header
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '#',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Referral name',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Earnings',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),

                // Referral items
                referralItem(1, 'A', '5000.00'),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                referralItem(2, 'Gaurav', '3000.00'),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),

          // Terms and conditions
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Read referral Terms & Conditions',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget referralItem(int index, String name, String earnings) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('$index'),
          ),
          Expanded(
            flex: 5,
            child: Text(name),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '$earnings',
              style: const TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
