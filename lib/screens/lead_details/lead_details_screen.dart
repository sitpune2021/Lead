import 'package:bizbooster/screens/lead_details/components/lead_details_card.dart';
import 'package:flutter/material.dart';

class LeadDetailsScreen extends StatelessWidget {
  const LeadDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lead Details"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Column(
        children: [
          Padding(padding: EdgeInsets.all(5.0), child: LeadDetailsCard()),
        ],
      ),
    );
  }
}
