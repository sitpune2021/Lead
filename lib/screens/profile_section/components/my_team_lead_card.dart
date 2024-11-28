// my_team_lead_card.dart

import 'package:bizbooster/screens/my_team_lead/my_team_lead_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

Widget myTeamLeadCard(BuildContext context) {
  return Card(
    color: Colors.white,
    elevation: 3, // Adds shadow to the card
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.emoji_events, // Use your custom icon here
          color: Colors.blue,
        ),
      ),
      title: Text(
        "My Team Lead",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "503224",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(width: 8),
          const Icon(Icons.chevron_right),
        ],
      ),
      onTap: () {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyTeamLeadScreen()),
          );
        });
      },
    ),
  );
}













// this is same code using tile 

// Card(
//     color: Colors.white,
//     elevation: 2,
//     child: Column(
//       children: [
//         ListTile(
//           leading: Container(
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//               color: Colors.blue[50],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(
//               Icons.emoji_events, // Use your custom icon here
//               color: Colors.blue,
//             ),
//           ),
//           title: const Text(
//             "My Team Lead",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           trailing: Container(
//             decoration: BoxDecoration(
//               color: Colors.blue[50],
//               borderRadius: BorderRadius.circular(20),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text(
//               "503224",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//           onTap: () {
//             // Handle document tap
//           },
//         ),
//       ],
//     ),
//   );