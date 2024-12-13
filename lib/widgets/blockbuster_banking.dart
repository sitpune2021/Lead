import 'package:bizbooster/widgets/onboarding_card.dart';
import 'package:bizbooster/widgets/pending_verification.dart';
import 'package:bizbooster/widgets/user_alert.dart';
import 'package:flutter/material.dart';

class BlockbusterBanking extends StatelessWidget {
  BlockbusterBanking({Key? key}) : super(key: key);
  final List<Map<String, String>> cardData = [
    {
      "imageurl":
          "https://d28wu8o6itv89t.cloudfront.net/images/sbicreditcardjpg-1707988309126.jpeg",
      "title": "Title1",
      "earnamount": "Earn Upto 2,000 /-",
    },
    {
      "imageurl": "https://pbs.twimg.com/media/FvRHepIWYAAmsmv.jpg:large",
      "title": "Title 2",
      "earnamount": "Earn Upto 3,000 /-",
    },
    {
      "imageurl": "https://via.placeholder.com/300x200.png?text=Customer+3",
      "title": "Title 3",
      "earnamount": "Earn Upto 1,500 /-",
    },
    {
      "imageurl": "https://via.placeholder.com/300x200.png?text=Customer+4",
      "title": "Title",
      "earnamount": "Earn Upto 4,000 /-",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 255, 213, 202),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       ClipRRect(
          //         borderRadius: BorderRadius.circular(8),
          //         child: Image.asset(
          //           "assets/images/lifelinecart.png",
          //           height: 60,
          //           width: 60,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //       const SizedBox(
          //           width: 2), // Added spacing between image and text
          //       const Expanded(
          //         // Use Expanded to prevent overflow
          //         child: Padding(
          //           padding: EdgeInsets.only(left: 8.0),
          //           child: Text(
          //             "Blockbuster Deals Banking and Finance",
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //               height: 1,
          //             ),
          //             // overflow: TextOverflow
          //             //     .ellipsis, // This can be kept for long texts
          //             textAlign: TextAlign.start,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.0),
          //   child: Text(
          //     "Blockbuster Deals LifelineCart Partner Blockbuster Deals LifelineCart Partner Blockbuster Deals LifelineCart Partner",
          //     style: TextStyle(fontSize: 16, color: Colors.orange),
          //   ),
          // ),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child: const _OnboardingCard(
                    imagePath: "assets/images/LocalB.jpg",
                    label: "Instant Loan",
                  ),
                ),
                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child: const _OnboardingCard(
                    imagePath: "assets/images/LocalB.jpg",
                    label: "Business Loan",
                  ),
                ),

                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child: const _OnboardingCard(
                    imagePath: "assets/images/LocalB.jpg",
                    label: "Account Opening",
                  ),
                ),

                InkWell(
                  onTap: () {
                    PendingVerification().showAlert(context);
                  },
                  child: const _OnboardingCard(
                    imagePath: "assets/images/empOn.jpg",
                    label: "Credit Card",
                  ),
                ),

                // _OnboardingCard(
                //   imagePath: "assets/images/LocalB.jpg",
                //   label: "Customer Onboarding",
                // ),
                // _OnboardingCard(
                //   imagePath: "assets/images/empOn.jpg",
                //   label: "App Downloads",
                // ),
                // _OnboardingCard(
                //   imagePath: "assets/images/empOn.jpg",
                //   label: "Local business",
                // ),
                // _OnboardingCard(
                //   imagePath: "assets/images/LocalB.jpg",
                //   label: "Branding Materials",
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 319,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                final data = cardData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CustomerOnboardingCard(
                    imageurl: data["imageurl"]!,
                    title: data["title"]!,
                    earnamount: data["earnamount"]!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingCard extends StatelessWidget {
  final String imagePath;
  final String label;

  const _OnboardingCard(
      {required this.imagePath, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: EdgeInsets.only(right: 8, left: 8, top: 8),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(12),
      //   border: Border.all(color: Colors.grey),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
