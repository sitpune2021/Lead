import 'package:flutter/material.dart';

class DocumentItem extends StatelessWidget {
  const DocumentItem({super.key, required this.title, required this.iconData});
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  iconData,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ), // Spacer pushes the button to the bottom
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[100],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {
              // Add download functionality here
            },
            child: const Text(
              'Download',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
