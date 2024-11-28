import 'package:bizbooster/screens/profile_section/Refer_and_earn/referal_earning_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReferAndEarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Refer and Earn'),
          actions: [
            IconButton(
              icon: Icon(Icons.help_outline),
              onPressed: () {
                // Help action
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Referral Stats Section
                _buildReferralStats(context),
                SizedBox(height: 16),
                // Offer Banner
                _buildOfferBanner(),
                SizedBox(height: 8),
                // Terms and Conditions Link
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Show terms and conditions
                    },
                    child: Text(
                      '*Read referral T&Cs',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Share Referral Link Section
                _buildShareReferralLink(),
                SizedBox(height: 16),
                // Pending 1st Sale Section with Tabs
                _buildPendingFirstSaleSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReferralStats(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReferralNetworkScreen()),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // First Text
              Expanded(
                flex: 2,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '2 ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'people joined',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Second Text
              Expanded(
                flex: 2,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '₹0.0 ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'referral earnings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Trailing Icon/Button
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOfferBanner() {
    return SizedBox(
      width: double.infinity, // Makes the width match its parent
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BIGGEST OFFER EVER!!!',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Refer & Earn ₹2,100\nAb kamao, har referral par!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // Navigate to "How it works"
              },
              child: Text(
                'See How it Works',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareReferralLink() {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Share referral link',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareOption(
                    FontAwesomeIcons.whatsapp, 'WhatsApp', Colors.green),
                _buildShareOption(Icons.message, 'SMS', Colors.blue),
                _buildShareOption(Icons.telegram, 'Telegram', Colors.lightBlue),
                _buildShareOption(Icons.more_horiz, 'Others', Colors.grey),
              ],
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[100],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'WV1Z7500',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.copy, size: 28), // Larger icon size
                    onPressed: () {
                      // Copy referral code action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32), // Larger icon size
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  // Widget _buildShareOption(IconData icon, String label) {
  //   return Column(
  //     children: [
  //       CircleAvatar(
  //         backgroundColor: Colors.blue.shade100,
  //         child: Icon(icon, color: Colors.blue),
  //       ),
  //       SizedBox(height: 8),
  //       Text(label, style: TextStyle(fontSize: 14)),
  //     ],
  //   );
  // }

  Widget _buildPendingFirstSaleSection() {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Pending 1st sale'),
                Tab(text: 'Invite friends'),
              ],
            ),
            SizedBox(
              height: 300, // Adjust height as needed
              child: TabBarView(
                children: [
                  _buildReferralList(),
                  Center(child: Text('Invite friends section')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReferralList() {
    final referrals = [
      {'name': 'A', 'status': 'Registered'},
      {'name': 'Gaurav', 'status': 'Registered'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Help your friends & earn referral incentives',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  softWrap:
                      false, // This ensures text wraps when it reaches the edge
                  overflow: TextOverflow
                      .ellipsis, // Optional: Adds ellipsis when text overflows
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Remind all action
                },
                child: const Text('Remind All'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Prevent scrolling inside the card
            itemCount: referrals.length,
            itemBuilder: (context, index) {
              final referral = referrals[index];
              return ListTile(
                leading: Text('${index + 1}'),
                title: Text(referral['name'] ?? ''),
                subtitle: Text(referral['status'] ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon:
                          Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                      onPressed: () {
                        // WhatsApp action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.message, color: Colors.blue),
                      onPressed: () {
                        // SMS action
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
