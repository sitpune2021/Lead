import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/merchant_onboarding.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        height: 70,
        color: Colors.white,
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     // "Learn More" Button
        //     ElevatedButton(
        //       onPressed: () {
        //         // Add action for "Learn More"
        //       },
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.green, // Button background color
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(8),
        //         ),
        //         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        //       ),
        //       child: const Text(
        //         'Add Lead',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),

        //     // "Download PDF File" Button
        //     ElevatedButton.icon(
        //       onPressed: () {
        //         // Add action for "Download PDF"
        //       },
        //       icon: const Icon(Icons.share, color: Colors.white),
        //       label: const Text(
        //         'Share to customer',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.purple, // Button background color
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(8),
        //         ),
        //         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        //       ),
        //     ),
        //   ],
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 50,
              width: 150, // Set the height of the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MerchantOnboarding(title: "Onboarding")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius:
                  //       BorderRadius.circular(10), // Rounded corners
                  // ),
                ),
                child: const Text(
                  "Add Lead",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              // Set the height of the button
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius:
                  //       BorderRadius.circular(10), // Rounded corners
                  // ),
                ),
                icon: const Icon(Icons.share, color: Colors.white),
                label: const Text(
                  "Share to customer",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
