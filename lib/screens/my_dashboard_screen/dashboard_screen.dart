import 'package:bizbooster/screens/my_dashboard_screen/components/dashboard_tiles.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final List<String> titles = [
    'My Lead Report',
    'My Team Lead Report',
    'My Earning',
    'Upgrade Package',
    'My Commission Sheet',
    'My Offer and Reward',
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const BannerWidget(
            image: "assets/images/franchise.jpg",
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft, // Align text to start (left)
                child: Text(
                  "My Dashboard",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 4, 74, 6),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 0), // Add spacing between text and grid
          Expanded(
            // Use Expanded to give the GridView remaining available space
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  // childAspectRatio: 1.2,
                  childAspectRatio: 1.1,
                ),
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Handle your click action here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            // '${titles[index]} tapped!',
                            "Your verification is pending",
                            style: TextStyle(color: Colors.black),
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: DashboardTile(title: titles[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
