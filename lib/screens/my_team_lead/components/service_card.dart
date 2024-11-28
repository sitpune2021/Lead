import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String location;
  final IconData logo;
  final int totalLead;
  final int activeLead;
  final int completeLead;
  final Color backgroundColor;

  const ServiceCard({
    super.key,
    required this.title,
    required this.location,
    required this.logo,
    required this.totalLead,
    required this.activeLead,
    required this.completeLead,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    int totalLeads = 25;
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 30,
                  child: Text(
                    "SK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "SATISH JAYWANT KADAM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Franchise Code :-",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SK07357HP",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[200],
                                foregroundColor: Colors.black,
                                textStyle: const TextStyle(fontSize: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set the radius here
                                ),
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10)),
                            child: const Text('Copy Code'),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Total Lead: - $totalLeads",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _leadcard("Lifelinecart Partner", Colors.blue[50]!),
            _leadcard(
                "Legal Services", const Color.fromARGB(255, 255, 239, 215))
          ],
        ),
      ),
    );
  }

  Widget _leadcard(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: color,
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
                        title,
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
