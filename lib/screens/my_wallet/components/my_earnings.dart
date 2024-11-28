import 'package:flutter/material.dart';

class MyEarnings extends StatelessWidget {
  const MyEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Earnings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            _buildEarningsRow('My Sales Earnings', '15367.00'),
            _buildEarningsRow('My Franchise Sales Earnings', '25465.00'),
            _buildEarningsRow('My FBA Team Earnings', '54634.00'),
            _buildEarningsRow('My Referral Earnings', '43453.00'),
            const Divider(height: 10, color: Colors.grey),
            _buildEarningsRow(
              'Total Earnings',
              '455345.00',
              isBold: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEarningsRow(String title, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
