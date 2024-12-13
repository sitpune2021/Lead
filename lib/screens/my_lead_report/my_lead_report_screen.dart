import 'package:bizbooster/screens/completed_projects/completed_project_screen.dart';
import 'package:bizbooster/screens/lead_details/lead_details_screen.dart';
import 'package:bizbooster/screens/my_lead_report/components/lead_report_card.dart';
import 'package:bizbooster/screens/rejected_leads/components/rejected_lead_card.dart';
import 'package:bizbooster/screens/rejected_leads/rejected_lead_screen.dart';
import 'package:flutter/material.dart';

class LeadReportScreen extends StatefulWidget {
  const LeadReportScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LeadReportScreenState();
  }
}

class _LeadReportScreenState extends State<LeadReportScreen> {
  int totalLeads = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Lead Report'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/lifelinecart.png'), // Add your image asset here
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Text(
                          'LifelineCart Partner',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.orange),
                          const Text(' Location, Pan India',
                              style: TextStyle(fontSize: 14)),
                          const SizedBox(width: 10),
                          Text(
                            "Total Lead: - $totalLeads",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Lead Status Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CompletedProjectScreen()),
                        );
                      },
                      child: _buildStatusCard(
                          "Completed",
                          Colors.green,
                          1,
                          Icon(Icons.check_circle,
                              size: 20, color: Colors.green)),
                    ),
                    _buildStatusCard(
                        "In Progress",
                        const Color.fromARGB(255, 247, 224, 24),
                        0,
                        Icon(
                          Icons.auto_mode_outlined,
                          size: 20,
                          color: Color.fromARGB(255, 247, 224, 24),
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RejectedLeadScreen()),
                        );
                      },
                      child: _buildStatusCard("Rejected", Colors.red, 0,
                          Icon(Icons.error, size: 20, color: Colors.red)),
                    ),
                    _buildStatusCard(
                        "Expired",
                        Colors.red,
                        1,
                        Icon(Icons.timer_off_rounded,
                            size: 20, color: Colors.red)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Search Bar
              Container(
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

              const SizedBox(height: 20),

              // Category Buttons
              GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 3,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildCategoryButton("Merchant Onboarding"),
                  _buildCategoryButton("Seller Onboarding"),
                  _buildCategoryButton("Partner Onboarding"),
                  _buildCategoryButton("Employee Onboarding"),
                  _buildCategoryButton("Customer Onboarding"),
                  _buildCategoryButton("App Downloads"),
                  _buildCategoryButton("Local Business"),
                  _buildCategoryButton("Branding Materials"),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LeadDetailsScreen()),
                    );
                  },
                  child: const LeadReportCard(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Method to create status card widget
  Widget _buildStatusCard(String label, Color color, int count, Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              // Icon(icon , size: 16, color: color),
              icon,
              const SizedBox(
                width: 5,
              ),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 20,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          // CircleAvatar(
          //   backgroundColor: color,
          //   child: Text(
          //     '$count',
          //     style: const TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  // Method to create category button widget
  Widget _buildCategoryButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.blue[50],
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
