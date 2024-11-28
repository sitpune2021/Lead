import 'package:bizbooster/screens/my_team_lead/components/service_card.dart';

import 'package:bizbooster/screens/my_team_lead_report/my_team_lead_report_screen.dart';

import 'package:flutter/material.dart';

class SuperFranchiseTeam extends StatefulWidget {
  const SuperFranchiseTeam({super.key});

  @override
  State<SuperFranchiseTeam> createState() => _SuperFranchiseTeamState();
}

class _SuperFranchiseTeamState extends State<SuperFranchiseTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const BannerWidget(
            //   image: "assets/images/franchise.jpg",
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 8),
            //   child: const Padding(
            //     padding: EdgeInsets.only(top: 8.0, left: 8.0),
            //     child: Align(
            //       alignment: Alignment.centerLeft, // Align text to start (left)
            //       child: Text(
            //         "My Team Lead",
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //             // color: Color.fromARGB(255, 4, 74, 6),
            //             color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Column(
            //     children: [
            //       TeamCard(
            //         title: 'My Franchise Team',
            //         value: 50,
            //         totalLead: 132,
            //       ),
            //       TeamCard(
            //         title: 'My FBA Team',
            //         value: 50,
            //         totalLead: 132,
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              margin:
                  EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0, top: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 255, 243),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.green, width: 1.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Expanded(
                      //   flex: 1,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(right: 8.0),
                      //     child: Center(
                      //       child: ClipRRect(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(8)),
                      //         child: Image.asset(
                      //           'assets/images/franchise.jpg', // Replace with your image asset path
                      //           width: 100,
                      //           height: 80,
                      //           fit: BoxFit.fill,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        // flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildStatRow("Total Super Franchise Team", "324",
                                Colors.blue),
                            _buildStatRow("Super Franchise Team Lead", "43524",
                                Colors.orange),
                            _buildStatRow("Super Franchise Team Earning",
                                "253375", Colors.green),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(
                        'Add Super Franchise Team',
                        style: TextStyle(fontSize: 18),
                      ),
                      icon: Icon(
                        Icons.share,
                        size: 20,
                        color: Colors.purple,
                      ),
                      iconAlignment: IconAlignment.end,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Search Bar
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 0.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search by name, type',
                        ),
                      ),
                    ),
                    Icon(Icons.filter_list, color: Colors.grey),
                  ],
                ),
              ),
            ),

            // const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyTeamLeadReportScreen()),
                      );
                    },
                    child: ServiceCard(
                      title: 'LifelineCart Partner',
                      location: 'Location, Pan India',
                      logo: Icons.shopping_cart,
                      totalLead: 25,
                      activeLead: 10,
                      completeLead: 10,
                      backgroundColor: Colors.green[50]!,
                    ),
                  ),

                  ServiceCard(
                    title: 'Legal Services',
                    location: 'Location, Pan India',
                    logo: Icons.article,
                    totalLead: 50,
                    activeLead: 30,
                    completeLead: 15,
                    backgroundColor: Colors.orange[50]!,
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => LeadReportScreen()),
                  //     );
                  //   },
                  //   child: MyLeadCard(),
                  // ),
                  // MyLeadCard(),
                  // MyLeadCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String title, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
