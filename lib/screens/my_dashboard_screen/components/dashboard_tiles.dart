import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  final String title;
  const DashboardTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisSize:
              MainAxisSize.min, // Prevents taking up extra vertical space
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  10.0), // Adjust the radius for rounded corners
              child: Image.asset(
                'assets/images/training.jpg', // Replace with your image path
                height: 120,
                width: MediaQuery.of(context)
                    .size
                    .width, // Add width to maintain the aspect ratio
                fit: BoxFit
                    .cover, // Cover ensures the image fits within the rounded box
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: true, // Allow text to wrap to the next line
            // maxLines: 3, // Restrict to a maximum of 3 lines
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
