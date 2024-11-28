import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String description;
  final String amount;
  final String date;
  final Color amountColor;
  final bool isHighlighted;
  final bool isReferral;

  const TransactionTile({
    super.key,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.amountColor,
    this.isHighlighted = false,
    this.isReferral = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      // color: isHighlighted ? Colors.white : Colors.white,
      child: ListTile(
        leading: isReferral
            ? const Icon(Icons.card_giftcard, color: Colors.orange)
            : const Icon(Icons.check_circle, color: Colors.green),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isHighlighted ? Colors.orange : Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 4),
            Text(date,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        trailing: Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: amountColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
