import 'package:bizbooster/screens/my_team_lead/franchise_team_screen.dart';
import 'package:bizbooster/screens/my_team_lead/super_franchise_team.dart';
import 'package:flutter/material.dart';

class MyTeamLeadScreen extends StatefulWidget {
  const MyTeamLeadScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyTeamLeadScreenState();
  }
}

class _MyTeamLeadScreenState extends State<MyTeamLeadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Team Lead"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  // This function is moved inside the state class
  Widget _buildUI() {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          // Tab bar below the card
          Container(
            color: Colors.white,
            child: TabBar(
              labelColor: Color.fromARGB(255, 80, 112, 76),
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: const [
                Tab(text: "Super Frenchise Team"),
                Tab(text: "Franchise Team"),
              ],
            ),
          ),

          // Tab content
          // Tab content
          const Expanded(
            child: TabBarView(
              children: [
                SuperFranchiseTeam(), // Wrap each tab's content with SingleChildScrollView
                FranchiseTeamScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
