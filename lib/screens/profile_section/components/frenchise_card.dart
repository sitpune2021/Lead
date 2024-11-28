import 'package:bizbooster/screens/5xGuarantee/guarantee.dart';
import 'package:bizbooster/screens/upgrade_package_screen/upgrade_package_screen.dart';
import 'package:flutter/material.dart';

class FranchiseSection extends StatelessWidget {
  const FranchiseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Franchise Package Section
        _buildFranchisePackageSection(context),
        const SizedBox(height: 20),
        // My Business Section
        _buildMyBusinessSection(context),
      ],
    );
  }

  Widget _buildFranchisePackageSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Franchise Package",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Card(
        //   color: Colors.white,
        //   elevation: 2,
        //   child: ListTile(
        //     leading: const Icon(Icons.star, color: Colors.green),
        //     title: const Text("My Package"),
        //     trailing: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Container(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //           decoration: BoxDecoration(
        //             color: Colors.yellow.shade100,
        //             borderRadius: BorderRadius.circular(12),
        //           ),
        //           child: const Text(
        //             "NEW",
        //             style: TextStyle(
        //               color: Colors.yellow,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //         const Icon(Icons.chevron_right),
        //       ],
        //     ),
        //   ),
        // ),
        Card(
          color: Colors.white,
          elevation: 3, // Adds shadow to the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            leading: const Icon(Icons.star, color: Colors.green),
            title: Text(
              "My Package",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "503224",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                const Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 300), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FranchiseScreen()),
                );
              });
            },
          ),
        )
      ],
    );
  }

  Widget _buildMyBusinessSection(BuildContext context) {
    final List<Map<String, dynamic>> businessItems = [
      {"icon": Icons.account_tree_outlined, "title": "Build Team"},
      {"icon": Icons.show_chart, "title": "My Commission Sheet"},
      {"icon": Icons.verified, "title": "5X Guarantee"},
      {"icon": Icons.card_giftcard, "title": "My Offer and Reward"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "My Business",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          color: Colors.white,
          elevation: 2,
          child: Column(
            children: businessItems
                .map(
                  (item) => ListTile(
                    leading: Icon(item["icon"], color: Colors.blue),
                    title: Text(item["title"]),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      if (item["title"] == "Build Team") {
                      } else if (item["title"] == "5X Guarantee") {
                        Future.delayed(const Duration(milliseconds: 150), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Guarantee()),
                          );
                        });
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
