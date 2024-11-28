import 'package:bizbooster/screens/rejected_leads/components/rejected_lead_card.dart';
import 'package:flutter/material.dart';

class RejectedLeadScreen extends StatelessWidget {
  const RejectedLeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rejected Leads"),
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
                  'Total Rejected Lead- ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '324',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Change this to the number of completed projects
              itemBuilder: (context, index) {
                return const RejectedLeadCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
