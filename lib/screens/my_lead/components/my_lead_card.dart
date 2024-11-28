import 'package:flutter/material.dart';

class MyLeadCard extends StatelessWidget {
  const MyLeadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            // border: Border.all(color: Colors.black26),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/lifelinecart.png'), // Add your image asset here
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LifelineCart Partner',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 0),
                      const Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 16, color: Colors.orange),
                          Text(' Location, Pan India',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.purple),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLeadStatus('Total Lead', '25', Colors.blue),
                    _buildLeadStatus('Active Lead', '10', Colors.orange),
                    _buildLeadStatus('Complete Lead', '10', Colors.green),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeadStatus(String label, String count, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: color),
        ),
        Text(
          count,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
