import 'package:flutter/material.dart';

class TransactionHistoryHeader extends StatelessWidget {
  const TransactionHistoryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2, left: 5, right: 5, bottom: 2),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transaction History',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              // Icon(Icons.tune, color: Colors.red),
              // SizedBox(width: 4), // Small space between icons
              Icon(Icons.tune, color: Colors.orange),
              // SizedBox(width: 4), // Small space between icons
              // Icon(Icons.tune, color: Colors.yellow),
            ],
          ),
        ],
      ),
    );
  }
}
