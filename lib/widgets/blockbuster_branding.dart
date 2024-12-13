import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:bizbooster/widgets/onboarding_card.dart';
import 'package:bizbooster/widgets/pending_verification.dart';

import 'package:flutter/material.dart';

class BlockbusterBranding extends StatelessWidget {
  BlockbusterBranding({Key? key}) : super(key: key);
  final List<Map<String, String>> cardData = [
    {
      "imageurl":
          "https://d28wu8o6itv89t.cloudfront.net/images/sbicreditcardjpg-1707988309126.jpeg",
      "title": "",
      "earnamount": "Earn Upto 2,000 /-",
    },
    {
      "imageurl": "https://pbs.twimg.com/media/FvRHepIWYAAmsmv.jpg:large",
      "title": "",
      "earnamount": "Earn Upto 3,000 /-",
    },
    {
      "imageurl": "https://via.placeholder.com/300x200.png?text=Customer+3",
      "title": "",
      "earnamount": "Earn Upto 1,500 /-",
    },
    {
      "imageurl": "https://via.placeholder.com/300x200.png?text=Customer+4",
      "title": "",
      "earnamount": "Earn Upto 4,000 /-",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 241, 255, 247),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannerWidget(
            imageurl:
                "https://i.pinimg.com/736x/20/85/88/208588fdc95286ac02a33b88e90875dc.jpg",
            image: "assets/images/franchise.jpg",
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
                      "Spellbinding Branding of Blockbuster Deals",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                      // overflow: TextOverflow
                      //     .ellipsis, // This can be kept for long texts
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _businessServicehorizontal(context),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: SizedBox(
              height: 390,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  final data = cardData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      onTap: () => PendingVerification().showAlert(context),
                      child: FranchiseCardd(
                        imageurl: data["imageurl"]!,
                        title: data["title"]!,
                        earnamount: data["earnamount"]!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _businessServicehorizontal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: SizedBox(
        height: 100, // Set a height for the horizontal ListView
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child:
                  buildIconColumn("assets/images/startup.png", "Logo Design"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/identification.png", "Branding"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/qualityservice.png", "Marketing"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn("assets/images/marketing.png", "Creative"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/leadership.png", "UI/UX Design"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child:
                  buildIconColumn("assets/images/leadership.png", "investment"),
            ),
            InkWell(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/leadership.png", "Traditional business"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconColumnOld(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
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
          Container(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
              maxLines: 1, // Limit to 2 lines
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconColumn(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 0, right: 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 166, 104, 12),
                  Color.fromARGB(255, 249, 146, 36),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
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
          ),
          const SizedBox(height: 5),
          Container(
            width: 85,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
              maxLines: 1, // Limit to 2 lines
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
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
//           const Column(
//             children: [
//               Text(
//                 "Earn Upto 1,00,000/-",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class FranchiseCardd extends StatelessWidget {
  final String imageurl;
  final String title;
  final String earnamount;

  const FranchiseCardd(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.earnamount});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.only(right: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: BorderSide(color: Colors.grey.shade500), // Apply border here
      ),
      child: Container(
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
            Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: const Color.fromARGB(255, 246, 232, 157),
                // color: Colors.yellow.shade100,
                // borderRadius: const BorderRadius.only(
                //     topLeft: Radius.circular(8),
                //     topRight: Radius.circular(8),
                //     bottomLeft: Radius.circular(8),
                //     bottomRight: Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      earnamount,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),

            // Earnings and Share Button Section
            // Earnings and Share Button Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  // color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Creative Starting",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Starting 499/-",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
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
