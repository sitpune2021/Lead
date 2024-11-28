import 'package:bizbooster/screens/completed_projects/completed_project_screen.dart';
import 'package:flutter/material.dart';

class LeadDetailsCard extends StatelessWidget {
  const LeadDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Row(
              children: [
                CircleAvatar(
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
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SATISH JAYWANT KADAM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Employee Onboarding",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Lead ID : 5638355867",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
            // const Divider(height: 20),

            // Contact Details
            const Text(
              "Contact details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.email_outlined, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      "Swarajycredit@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      "9970856114",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 30),

            // Status Section
            const Text(
              "Status",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),

            // Status 1: Lead Started
            const Row(
              children: [
                Icon(
                  Icons.task_alt,
                  color: Colors.lightBlue,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lead Started",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "First point of sale.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "18/09/2024",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.amber,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'In Progress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Follow up with the customer to complete the application. It can take upto 7 days to get it tracked.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Lead Date and Update Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lead Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Text(
                            '18-09-2024',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Update Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Text(
                            '19-09-2024',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 30),

            // Self Follow Up Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => CompletedProjectScreen()),
                    // );
                  },
                  icon: const Icon(Icons.update, color: Colors.white),
                  label: const Text(
                    "Self Follow Up",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.phone, color: Colors.green),
                      onPressed: () {
                        // Implement call functionality here
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.message, color: Colors.blue),
                      onPressed: () {
                        // Implement messaging functionality here
                      },
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.wechat_rounded, color: Colors.green),
                      onPressed: () {
                        // Implement WhatsApp functionality here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
