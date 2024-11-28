import 'package:flutter/material.dart';

class GuaranteeCard extends StatelessWidget {
  final int id;
  final String dateRange;
  final int targetLead;
  final int successLead;
  final int failedLead;
  final int percentage;

  const GuaranteeCard({
    super.key,
    required this.id,
    required this.dateRange,
    required this.targetLead,
    required this.successLead,
    required this.failedLead,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 161, 154, 200),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.0),
                  topRight: Radius.circular(7.0)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$id', // Placeholder for ID; change as needed
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateRange,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                    Text(
                      'Target Lead - $targetLead',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[600],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$percentage%',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 18.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 0.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Divider(color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Lead -',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Text(
                      '$targetLead',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Text(
                //   'Total Lead - $targetLead',
                //   style: const TextStyle(
                //     fontSize: 14.0,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // ),
                const SizedBox(height: 4.0),
                const Divider(color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Successful Lead',
                        style: TextStyle(color: Colors.black)),
                    Text(
                      '$successLead',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                const Divider(color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Failed Lead',
                        style: TextStyle(color: Colors.red)),
                    Text(
                      '$failedLead',
                      style: const TextStyle(
                        color: Colors.red,
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
