import 'package:flutter/material.dart';

class PendingVerification {
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              // Main Content
              Container(
                width: 350, // Set a fixed width to match the style
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.red, // Red border color
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20), // Space for the close icon
                    // Image (centered illustration with placeholder dimensions)
                    Image.asset(
                      'assets/images/alertbox.png', // Replace with your image path
                      width: 350,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20),

                    // Alert text
                    Text(
                      'Your Training and verification is pending',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),

                    // "Contact Support" button with border and specific color
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue, width: 2),
                        color:
                            Colors.blue[100], // Green background at the bottom
                      ),
                      child: TextButton(
                        onPressed: () {
                          print('Contact support button clicked!');
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Contact Support',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue, // Text color in blue
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Close Icon Positioned at the Top Right
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
