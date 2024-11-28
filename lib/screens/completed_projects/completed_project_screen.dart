import 'package:bizbooster/screens/completed_projects/components/completed_project_card.dart';
import 'package:flutter/material.dart';

class CompletedProjectScreen extends StatelessWidget {
  const CompletedProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed projects"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total Complete Lead- ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '324',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Change this to the number of completed projects
              itemBuilder: (context, index) {
                return const CompletedProjectCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
