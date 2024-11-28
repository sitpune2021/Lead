import 'package:bizbooster/screens/Certification/courses_screen.dart';
import 'package:bizbooster/screens/Certification/live_training_screen.dart';
import 'package:flutter/material.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Certification"),
        centerTitle: true,
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
            height: 60,
            color: Colors.white,
            child: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: const [
                Tab(text: "Live Training"),
                Tab(text: "Courses"),
              ],
            ),
          ),

          // Tab content
          // Tab content
          const Expanded(
            child: TabBarView(
              children: [
                LiveTrainingScreen(),
                CoursesScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
