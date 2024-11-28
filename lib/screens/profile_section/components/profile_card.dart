// profile_card.dart

import 'package:bizbooster/screens/ProfileCard/profile_card_screen.dart';
import 'package:flutter/material.dart';

Widget profileCard(
  BuildContext context,
  String name,
  String mobileno,
  String image,
) {
  return Center(
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Name and phone number
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.badge, // Train icon as placeholder
                        size: 20,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    mobileno,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Row(
                    children: [
                      const Text(
                        "View Profile",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileCardScreen(
                                name: name ?? "Unknown Name", // Default if null
                                mobileno: mobileno ??
                                    "Unknown Number", // Default if null
                                image: image ?? "",
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.chevron_right, // Replace with your desired icon
                          size: 25,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Circular status
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer green circle
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                  ),
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 3,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),

                // Inner blue circle with profile icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[50], // Background color
                  ),
                  child: ClipOval(
                    child: Image.network(
                      "http://43.205.22.150:5000/users/$image", // Your image URL
                      fit: BoxFit.cover, // Ensures the image covers the circle
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.blue[50],
                          child: const Icon(
                            Icons
                                .person, // Fallback icon if the image fails to load
                            size: 35,
                            color: Colors.white70,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Bottom "100%" badge
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 20, 89, 25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "100%",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
