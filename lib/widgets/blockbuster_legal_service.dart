import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:bizbooster/widgets/pending_verification.dart';

import 'package:flutter/material.dart';

class BlockbusterLegalService extends StatelessWidget {
  const BlockbusterLegalService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BannerWidget(
            image: "assets/images/onlineclass.jpg",
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  // Use Expanded to prevent overflow
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Blockbuster Deals Legal Services",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                      // overflow: TextOverflow
                      //     .ellipsis, // This can be kept for long texts
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),

          _businessServicehorizontal(context),

          // Use GridView to display the icons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 3, // Number of columns in the grid
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent scrolling inside GridView
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child: buildIconCard(
                      'assets/images/proprietorship.png', "Proprietorship"),
                ),
                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child: buildIconCard('assets/images/gst.png', "FSSI"),
                ),
                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child:
                      buildIconCard('assets/images/trademark.png', "Trademark"),
                ),
                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child:
                      buildIconCard('assets/images/trademark.png', "Trademark"),
                ),
                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child:
                      buildIconCard('assets/images/trademark.png', "Trademark"),
                ),
                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child:
                      buildIconCard('assets/images/trademark.png', "Trademark"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _businessServicehorizontal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 110, // Set a height for the horizontal ListView
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/onlineregistration.png", "Registration"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/compliance.png", "Compliances"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn("assets/images/startup.png", "Startup"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn("assets/images/marketing.png", "Lawyers"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child:
                  buildIconColumn("assets/images/leadership.png", "csc center"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconColumn(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 35, // Set the width to fit inside the CircleAvatar
                height: 35, // Set the height to fit inside the CircleAvatar
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

Widget buildIconCard(String imagePath, String label) {
  return SizedBox(
    width: 80,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5), // Add radius here
              child: Image.asset(
                imagePath,
                height: 80, // Adjusted height
                width: 100, // Adjusted width
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis, // Handle overflow
          maxLines: 1,
        ),
      ],
    ),
  );
}





// class FranchiseCard extends StatelessWidget {
//   const FranchiseCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(5),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         // color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(15),
//         // border: Border.all(color: Colors.green, width: 3),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.asset(
//               "assets/images/food.jpg",
//               height: 120,
//               width: 150,
//               fit: BoxFit.fill,
//             ),
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             "Earn Upto 1,00,000/-",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
