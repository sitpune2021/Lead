import 'package:flutter/material.dart';

Widget dashboardCard({
  required String title,
  String value = "",
  Color valueColor = Colors.black,
  IconData? icon,
  VoidCallback? onTap, // Add onTap callback
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap, // Trigger the onTap when the card is tapped
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display value or icon
              if (value.isNotEmpty)
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                )
              else if (icon != null)
                Icon(
                  icon,
                  size: 30,
                  color: Colors.blue,
                ),
              const SizedBox(height: 8),
              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
