import 'package:flutter/material.dart';

class GuaranteeHeader extends StatelessWidget {
  const GuaranteeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Avatar
          const CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 30.0,
            child: Icon(Icons.person, size: 40.0, color: Colors.white),
          ),
          const SizedBox(width: 10.0),
          // Information Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                const Row(
                  children: [
                    Text(
                      'Name : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Satish Jaywant Kadam',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                // Franchise Name
                RichText(
                  text: TextSpan(
                    text: 'Franchise Name : ',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Premium Franchise',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.yellow[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4.0),
                // Franchise Code
                const Row(
                  children: [
                    Text(
                      'Franchise Code : ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: Text(
                        'SK07357PP',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 2.0),
                // Onboard Date and Target Lead
                const Row(
                  children: [
                    Text(
                      'Onboard Date :',
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '12/11/2024',
                      style: TextStyle(
                        color: Colors.green,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Target Lead -',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '25/M',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
