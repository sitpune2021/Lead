import 'package:bizbooster/screens/my_wallet/components/transaction_history_header.dart';
import 'package:bizbooster/screens/my_wallet/components/transacton_tile.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const TransactionHistoryHeader(),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            children: const [
              TransactionTile(
                title: 'Lead complete',
                description: 'Lead ID : T767642578547',
                amount: '+990',
                date: '14 Sep 2023, 03:14 PM',
                amountColor: Colors.green,
                isHighlighted: false,
              ),
              TransactionTile(
                title: 'Lead complete (Frenchise Onboard)',
                description: 'Lead ID : T767642578547',
                amount: '+5000',
                date: '14 Sep 2023, 03:14 PM',
                amountColor: Colors.green,
                isHighlighted: true,
              ),
              TransactionTile(
                title: 'Lead complete (FBA Onboard)',
                description: 'Lead ID : T767642578547',
                amount: '+1000',
                date: '14 Sep 2023, 03:14 PM',
                amountColor: Colors.green,
                isHighlighted: true,
              ),
              TransactionTile(
                title: 'Send For Bank',
                description: 'TXN ID : T767642578547',
                amount: '-300',
                date: '14 Sep 2023, 03:14 PM',
                amountColor: Colors.red,
                isHighlighted: false,
              ),
              TransactionTile(
                title: 'Rewarded From Referral',
                description:
                    'Promote Lifelinekart for sanjay jadhav\nTXN ID : T767642578547',
                amount: '+1000',
                date: '14 Sep 2023, 03:14 PM',
                amountColor: Colors.green,
                isHighlighted: false,
                isReferral: true,
              ),
              TransactionTile(
                title: 'Lead complete (Frenchise Sales)',
                description: 'Lead ID : T767642578547',
                amount: '+300',
                date: '14 Sep 2023, 03:14 PM',
                amountColor: Colors.green,
                isHighlighted: false,
              ),
              TransactionTile(
                title: 'Lead complete (FBA Sales)',
                description: 'Lead ID : T767642578547',
                amount: '+300',
                date: '14 Sep 2023, 03:14 PM',
                amountColor: Colors.green,
                isHighlighted: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
