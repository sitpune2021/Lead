import 'package:bizbooster/screens/build_team/components/add_team_card.dart';
import 'package:bizbooster/screens/build_team/components/build_team_card.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class BuildTeam extends StatefulWidget {
  const BuildTeam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BuildTeamState();
  }
}

class _BuildTeamState extends State<BuildTeam> {
  final List<BuildTeamOffer> offers = [
    BuildTeamOffer(
      title: 'FBA',
      duration: 'Lifetime',
      price: '3499/-',
      image: 'assets/images/icicibank.jpeg', // Replace with your image path
    ),
    BuildTeamOffer(
      title: '',
      duration: '',
      price: '',
      image: '', // Replace with your image path
    ),
    BuildTeamOffer(
      title: 'Super Franchise',
      duration: '3 YEARS',
      price: '49,999/-',
      image: 'assets/images/franchise.jpg', // Replace with your image path
    ),
    BuildTeamOffer(
      title: 'Franchise',
      duration: '5 YEARS',
      price: '9,999/-',
      image: 'assets/images/icicibank.jpeg', // Replace with your image path
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Team"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  // This function is moved inside the state class
  Widget _buildUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BannerWidget(
            image: "assets/images/franchise.jpg",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                // Each card will take 50% of the width
                Flexible(
                  flex: 1,
                  child: BuildTeamCard(
                    offer: offers[0],
                    konwMoreTitle: 'Know More',
                  ),
                ),
                const SizedBox(width: 10),
                const Flexible(
                    flex: 1, child: AddTeamCard(konwMoreTitle: "Add Team")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each franchise card
  Widget buildFranchiseCard({
    required String title,
    required String price,
    required String years,
    required String imageUrl,
    required String knowBenefitsButtonText,
    required String addButtonTitle,
    required Color cardColor,
    required Color benefitsColor,
    required Color statsColor,
    int? totalTeam,
    int? teamLeads,
    int? teamEarnings,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left image and price part
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Image.asset(imageUrl, height: 100, fit: BoxFit.cover),
                      const SizedBox(height: 8),
                      Text(
                        "$years FRANCHISE PACKAGE",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.orange),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right side details
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.amber[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (totalTeam != null)
                        Text(
                          "Total $title Team: $totalTeam",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: statsColor,
                          ),
                        ),
                      if (teamLeads != null)
                        Text(
                          "$title Team Lead: $teamLeads",
                          style: const TextStyle(color: Colors.orange),
                        ),
                      if (teamEarnings != null)
                        Text(
                          "$title Team Earning: $teamEarnings",
                          style: TextStyle(color: statsColor),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Know Benefits and Add Team buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: benefitsColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(knowBenefitsButtonText),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: benefitsColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(addButtonTitle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
