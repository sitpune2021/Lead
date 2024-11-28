import 'package:bizbooster/screens/Lead_Details_onboarding/freanchise_components/franchise_details_tab.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/components/product_details_tab.dart';
import 'package:flutter/material.dart';

class LeadOnboardDetailScreen extends StatefulWidget {
  final String id;
  final String title;
  final String imageurl;
  const LeadOnboardDetailScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.imageurl});

  @override
  State<LeadOnboardDetailScreen> createState() =>
      _LeadOnboardDetailScreenState();
}

class _LeadOnboardDetailScreenState extends State<LeadOnboardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          // Tab bar below the card
          Container(
            color: Colors.white,
            child: const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: "Product Details"),
                Tab(text: "Franchise Details"),
              ],
            ),
          ),

          // Tab content
          // Tab content
          Expanded(
            child: TabBarView(
              children: [
                ProductDetailsTab(
                  id: widget.id,
                  imageurl: widget.imageurl,
                ), // Wrap each tab's content with SingleChildScrollView
                FranchiseDetailsTab(imageurl: widget.imageurl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantOnboardingCardd extends StatelessWidget {
  final String title;
  final String imageUrl;

  final bool isTrending;

  const RestaurantOnboardingCardd({
    super.key,
    required this.title,
    required this.imageUrl,
    // required this.earningText,
    // required this.earningAmount,
    this.isTrending = false,
    // this.route,
    // this.sharelink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Title section
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
              // topRight: Radius.circular(16),
            ),
            child: Stack(
              children: [
                Image.network(
                  imageUrl, // Image passed via constructor
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                if (isTrending) // Show trending banner only if true
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Row(
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            "Trending",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // // Title
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          //   child: Text(
          //     title, // Title passed via constructor
          //     style: const TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),

          // const SizedBox(height: 5), // Extra spacing at the bottom
        ],
      ),
    );
  }
}

// Sample content for Product Details tab

// Sample content for Franchise Details tab
