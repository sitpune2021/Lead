import 'package:bizbooster/screens/5xGuarantee/components/guarantee_card.dart';
import 'package:flutter/material.dart';

class GuaranteeCardList extends StatelessWidget {
  const GuaranteeCardList({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for the list
    final List<Map<String, dynamic>> guaranteeData = [
      {
        'id': 1,
        'dateRange': '01/11/2024 - 01/12/2024',
        'targetLead': 25,
        'successLead': 14,
        'failedLead': 11,
        'percentage': 100
      },
      {
        'id': 2,
        'dateRange': '01/10/2024 - 01/11/2024',
        'targetLead': 20,
        'successLead': 12,
        'failedLead': 8,
        'percentage': 90
      },
      {
        'id': 3,
        'dateRange': '01/10/2024 - 01/11/2024',
        'targetLead': 20,
        'successLead': 12,
        'failedLead': 8,
        'percentage': 90
      },
      // Add more entries as needed
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: guaranteeData.length,
      itemBuilder: (context, index) {
        final data = guaranteeData[index];
        return GuaranteeCard(
          id: data['id'],
          dateRange: data['dateRange'],
          targetLead: data['targetLead'],
          successLead: data['successLead'],
          failedLead: data['failedLead'],
          percentage: data['percentage'],
        );
      },
    );
  }
}
