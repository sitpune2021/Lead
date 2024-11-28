// import 'package:flutter/material.dart';

// class OnboardingCards extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imagePath;
//   final String earnAmount;
//   final String status;
//   final bool isTrending;

//   const OnboardingCards({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.imagePath,
//     required this.earnAmount,
//     required this.status,
//     this.isTrending = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: const Text("Restaurant Onboarding"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             elevation: 5,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Upper Row with 'Earn Upto' and 'Top Selling'
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 8.0, vertical: 4.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(4.0),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Text(
//                           "Earn Upto $earnAmount",
//                           style: const TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.info_outline, color: Colors.grey),
//                           const SizedBox(width: 8.0),
//                           Text(
//                             status,
//                             style: const TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Main Content with Image and Title
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.green[100],
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           imagePath, // Image from the provided path
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                           height: 150,
//                         ),
//                         if (isTrending)
//                           Positioned(
//                             top: 8,
//                             right: 8,
//                             child: Container(
//                               padding: const EdgeInsets.all(4.0),
//                               color: Colors.yellow,
//                               child: const Text(
//                                 "Trending",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         Positioned(
//                           bottom: 16,
//                           left: 16,
//                           child: Text(
//                             title,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Lower Section with 'Compare', 'Favourite', and 'Share' button
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 8.0, vertical: 4.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.compare_arrows),
//                             onPressed: () {},
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.favorite_border),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                       ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.purple,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                         onPressed: () {
//                           // Share functionality
//                         },
//                         icon: const Icon(Icons.share, color: Colors.white),
//                         label: const Text(
//                           "Share to Customer",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bizbooster/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class RestaurantOnboardingCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? earningText;
  final String? earningAmount;
  final bool? isTrending;
  final Widget? route;
  final String? sharelink;

  const RestaurantOnboardingCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.earningText,
    this.earningAmount,
    this.isTrending = false,
    this.route,
    this.sharelink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper banner with earning and top-selling indicators
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 218, 251),
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  child: Row(
                    children: [
                      Text(
                        earningText ?? "Earn upto ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        earningAmount ?? "1000",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 8),
                    Text(
                      "TOP SELLING",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Image and Title section
          ClipRRect(
            borderRadius: const BorderRadius.only(
                // topLeft: Radius.circular(16),
                // topRight: Radius.circular(16),
                ),
            child: Stack(
              children: [
                Image.network(
                  "$servicecardimageurl$imageUrl", // Image passed via constructor
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                if (isTrending ?? true) // Show trending banner only if true
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Row(
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            "Trending",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              title, // Title passed via constructor
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Share Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Share.share(
                      'Check out this amazing app:$sharelink',
                    );
                  }, // https://your-app-link.com
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  icon: const Icon(Icons.share, color: Colors.white),
                  label: const Text(
                    "Share to Customer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12), // Extra spacing at the bottom
        ],
      ),
    );
  }
}
