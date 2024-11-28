// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// class OnboardingGrid extends StatelessWidget {
//   const OnboardingGrid({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     "assets/images/lifelinecart.png",
//                     height: 60,
//                     width: 60,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 2),
//                 const Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text(
//                       "Blockbuster Deals LifelineCart partner",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         height: 1,
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 410,
//             child: GridView.count(
//               crossAxisCount: 3,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 const _OnboardingCard(
//                   imagePath: "assets/images/LocalB.jpg",
//                   label: "Merchant Onboarding",
//                 ),
//                 const _OnboardingCard(
//                   imagePath: "assets/images/LocalB.jpg",
//                   label: "Seller Onboarding",
//                 ),
//                 const _OnboardingCard(
//                   imagePath: "assets/images/LocalB.jpg",
//                   label: "Partner Onboarding",
//                 ),
//                 const _OnboardingCard(
//                   imagePath: "assets/images/empOn.jpg",
//                   label: "Employee Onboarding",
//                 ),
//                 const _OnboardingCard(
//                   imagePath: "assets/images/LocalB.jpg",
//                   label: "Customer Onboarding",
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Share.share(
//                       'Check out this amazing app: https://your-app-link.com',
//                     );
//                   },
//                   child: const _OnboardingCard(
//                     imagePath: "assets/images/empOn.jpg",
//                     label: "App Downloads",
//                   ),
//                 ),
//                 const _OnboardingCard(
//                   imagePath: "assets/images/empOn.jpg",
//                   label: "Local business",
//                 ),
//                 const _OnboardingCard(
//                   imagePath: "assets/images/LocalB.jpg",
//                   label: "Branding Materials",
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _OnboardingCard extends StatelessWidget {
//   final String imagePath;
//   final String label;

//   const _OnboardingCard(
//       {required this.imagePath, required this.label, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Image.asset(
//             imagePath,
//             height: 80, // Adjust height as needed
//             width: 100,
//             fit: BoxFit.fill,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Flexible(
//           // Use Flexible to handle overflow
//           child: SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               softWrap: true,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomerOnboardingCard extends StatelessWidget {
  final String imageurl;
  final String title;
  final String earnamount;

  const CustomerOnboardingCard(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.earnamount});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: BorderSide(color: Colors.grey.shade500), // Apply border here
      ),
      color: Colors.white,
      child: Container(
        // height: MediaQuery.of(context).size.height,
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Illustration Area
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  imageurl, // Replace with your image asset path
                  height: 250,
                  fit: BoxFit.cover,
                  // loadingBuilder: (context, child, loadingProgress) {
                  //   if (loadingProgress == null) {
                  //     return child; // Image loaded successfully
                  //   } else {
                  //     return Center(
                  //       child: CircularProgressIndicator(
                  //         value: loadingProgress.expectedTotalBytes != null
                  //             ? loadingProgress.cumulativeBytesLoaded /
                  //                 (loadingProgress.expectedTotalBytes ?? 1)
                  //             : null,
                  //       ),
                  //     );
                  //   }
                  // },
                ),
              ),
            ),
            // Title Text
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),

            // Earnings and Share Button Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: const Color.fromARGB(255, 246, 232, 157),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 190,
                    child: Text(
                      earnamount,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your share functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Share',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
