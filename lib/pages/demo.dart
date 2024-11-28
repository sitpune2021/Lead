// import 'package:flutter/material.dart';

// class MyDashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Dashboard'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.switch_account),
//             onPressed: () {
//               // Switch seller functionality
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.blue,
//             padding: EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Good evening, Satish Sir...',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 // Add your switch seller icon or button here
//                 Icon(Icons.notifications, color: Colors.white),
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(16.0),
//             color: Colors.orange,
//             child: Center(
//               child: Text(
//                 'Join Our Webinars Now!',
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//           ),
//           // Earning and Lead section
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       '₹45687.00',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     Text('My Earning'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       '687',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     Text('My Lead'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       '456',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     Text('My Team Lead'),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Buttons section
//           Expanded(
//             child: GridView.count(
//               crossAxisCount: 3,
//               children: [
//                 _buildGridItem(Icons.document_scanner, 'My Documents'),
//                 _buildGridItem(Icons.verified_user, 'KYC'),
//                 _buildGridItem(Icons.star, '5X Guarantee'),
//                 _buildGridItem(Icons.share, 'Refer & Earn'),
//                 _buildGridItem(Icons.group, 'Build Team'),
//                 _buildGridItem(Icons.web, 'Webinar'),
//                 _buildGridItem(Icons.school, 'Academy'),
//                 _buildGridItem(Icons.flag, 'My Goal'),
//                 _buildGridItem(Icons.store, 'My Store'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGridItem(IconData icon, String title) {
//     return Card(
//       margin: EdgeInsets.all(8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 30),
//           SizedBox(height: 8),
//           Text(title, textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: MyDashboard(),
//   ));
// }

import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Icon Row Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIconColumn(Icons.folder, "My Documents"),
              buildIconColumn(Icons.verified_user, "KYC"),
              buildIconColumn(Icons.verified, "5X Guarantee"),
              buildIconColumn(Icons.share, "Refer & Earn"),
              buildIconColumn(Icons.group, "Build Team"),
            ],
          ),
        ),
      ),
    );
  }

  Column buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.greenAccent,
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
