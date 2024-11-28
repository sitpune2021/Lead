import 'package:bizbooster/screens/upgrade_package_screen/upgrade_package_screen.dart';
import 'package:flutter/material.dart';

class AddTeamCard extends StatelessWidget {
  // final AddTeam offer;
  final String konwMoreTitle;

  const AddTeamCard({super.key, required this.konwMoreTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Super Frenchise Team',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            _buildEarningsRow('Total Super Frenchise Team', '324'),
            _buildEarningsRow('Super Frenchise Team Lead', '43524'),
            _buildEarningsRow('Super Frenchise Team Earning', '253375'),
            const Divider(height: 10, color: Colors.grey),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement your onPressed functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size.infinite,
                      backgroundColor: Colors.orange, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      konwMoreTitle,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
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

class AddTeam {
  final String title;
  final String duration;
  final String price;
  final String image;

  AddTeam({
    required this.title,
    required this.duration,
    required this.price,
    required this.image,
  });
}
