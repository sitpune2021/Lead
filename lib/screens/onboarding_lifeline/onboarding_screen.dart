// import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/components/onboarding_cards.dart';
// import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/seller_onboarding.dart';
// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _OnboardingScreenState();
//   }
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Onboarding"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: SafeArea(child: _buildUI()),
//     );
//   }

//   Widget _buildUI() {
//     return SafeArea(
//       child: Container(
//         margin: const EdgeInsets.only(top: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Expanded(child: _buildRestaurantOnboardingList()),
//               // _buildRowOfCards([
//               //   const _OnboardingCard(
//               //     imagePath: "assets/images/LocalB.jpg",
//               //     label: "Merchant Onboarding",
//               //   ),
//               //   InkWell(
//               //     onTap: () {
//               //       Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //             builder: (context) => const SellerOnboarding()),
//               //       );
//               //     },
//               //     child: const _OnboardingCard(
//               //       imagePath: "assets/images/LocalB.jpg",
//               //       label: "Seller Onboarding",
//               //     ),
//               //   ),
//               //   const _OnboardingCard(
//               //     imagePath: "assets/images/LocalB.jpg",
//               //     label: "Partner Onboarding",
//               //   ),
//               // ]),
//               // _buildRowOfCards([
//               //   const _OnboardingCard(
//               //     imagePath: "assets/images/empOn.jpg",
//               //     label: "Employee Onboarding",
//               //   ),
//               //   const _OnboardingCard(
//               //     imagePath: "assets/images/LocalB.jpg",
//               //     label: "Customer Onboarding",
//               //   ),
//               //   InkWell(
//               //     onTap: () {
//               //       Share.share(
//               //         'Check out this amazing app: https://your-app-link.com',
//               //       );
//               //     },
//               //     child: const _OnboardingCard(
//               //       imagePath: "assets/images/empOn.jpg",
//               //       label: "App Downloads",
//               //     ),
//               //   ),
//               // ]),
//               // _buildRowOfCards([
//               //   const _OnboardingCard(
//               //     imagePath: "assets/images/empOn.jpg",
//               //     label: "Local business",
//               //   ),
//               //   const _OnboardingCard(
//               //     imagePath: "assets/images/LocalB.jpg",
//               //     label: "Branding Materials",
//               //   ),
//               //   const _OnboardingCard(
//               //     imagePath: "assets/images/LocalB.jpg",
//               //     label: "More \nOptions", // Placeholder for additional options
//               //   ),
//               // ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRestaurantOnboardingList() {
//     final List<OnboardingCards> cards = [
//       const OnboardingCards(
//         title: "Restaurant Onboarding 1",
//         subtitle: "Subtitle 1",
//         imagePath: 'assets/images/LocalB.jpg',
//         earnAmount: "₹2100",
//         status: "TOP SELLING",
//         isTrending: true,
//       ),
//       const OnboardingCards(
//         title: "Restaurant Onboarding 2",
//         subtitle: "Subtitle 2",
//         imagePath: 'assets/images/LocalB.jpg',
//         earnAmount: "₹1500",
//         status: "NEW",
//         isTrending: false,
//       ),
//       const OnboardingCards(
//         title: "Restaurant Onboarding 3",
//         subtitle: "Subtitle 3",
//         imagePath: 'assets/images/LocalB.jpg',
//         earnAmount: "₹2500",
//         status: "TRENDING",
//         isTrending: true,
//       ),
//     ];

//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: cards.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: cards[index],
//         );
//       },
//     );
//   }

//   Widget _buildRowOfCards(List<Widget> cards) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: cards
//           .map((card) => Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   child: card,
//                 ),
//               ))
//           .toList(),
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
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(
//                 imagePath,
//                 height: 100,
//                 width: 120,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             const SizedBox(height: 8),
//             SizedBox(
//               width: 100,
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 softWrap: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bizbooster/screens/Lead_Details_onboarding/lead_onboard_detail_screen.dart';
import 'package:bizbooster/screens/my_team_lead/components/service_card.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/components/category_card.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/components/model/servicecard.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/components/onboarding_cards.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/merchant_onboarding.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/seller_onboarding.dart';
import 'package:bizbooster/services/auth_services.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final String id;
  final String title;
  const OnboardingScreen({super.key, required this.id, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<RestaurantOnboardingCard> cards = [
    const RestaurantOnboardingCard(
        title: "Merchant Onboarding",
        imageUrl: 'assets/images/merchantonboard.jpeg',
        earningText: "Earn Upto ",
        earningAmount: "₹2100",
        isTrending: false,
        route: null),
    const RestaurantOnboardingCard(
        title: "Seller Onboarding",
        imageUrl: 'assets/images/merchantonboard.jpeg',
        earningText: "Earn Upto ",
        earningAmount: "₹1800",
        isTrending: false,
        route: SellerOnboarding()),
    const RestaurantOnboardingCard(
        title: "Partner Onboarding",
        imageUrl: 'assets/images/merchantonboard.jpeg',
        earningText: "Earn Upto ",
        earningAmount: "₹2500",
        isTrending: true,
        route: null),
    const RestaurantOnboardingCard(
        title: "Employee Onboarding",
        imageUrl: 'assets/images/merchantonboard.jpeg',
        earningText: "Earn Upto ",
        earningAmount: "₹2500",
        isTrending: true,
        route: null),
    const RestaurantOnboardingCard(
        title: "Customer Onboarding",
        imageUrl: 'assets/images/merchantonboard.jpeg',
        earningText: "Earn Upto ",
        earningAmount: "₹2500",
        isTrending: true,
        route: null),
    const RestaurantOnboardingCard(
        title: "App Downloads",
        imageUrl: 'assets/images/merchantonboard.jpeg',
        earningText: "Earn Upto ",
        earningAmount: "₹2500",
        isTrending: true,
        route: null),
    const RestaurantOnboardingCard(
      title: "Local business",
      imageUrl: 'assets/images/merchantonboard.jpeg',
      earningText: "Earn Upto ",
      earningAmount: "₹2500",
      isTrending: true,
      route: null,
    ),
    const RestaurantOnboardingCard(
        title: "Branding Materials",
        imageUrl: 'assets/images/merchantonboard.jpeg',
        earningText: "Earn Upto ",
        earningAmount: "₹2500",
        isTrending: true,
        route: null),
    // Add more cards as needed
  ];

  late Future<List<ServiceCard>> futureCards;

  @override
  void initState() {
    super.initState();
    // futureCards = AuthService().fetchService(Widget.id) ; // Fetch the cards data when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Browse Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // Container(
            //     color: Colors.white,
            //     height: 150,
            //     child: const HorizontalCardList()),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MerchantOnboardingCard(widget.title),
            ),

            searchBar(),
            filterTypeButtons(),

            FutureBuilder<List<ServiceCardd>>(
              future: AuthService().fetchService(widget.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available.'));
                } else {
                  // Display the list of cards from the API response
                  final cards = snapshot.data!;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8.0),
                    shrinkWrap:
                        true, // This prevents the ListView from taking all the available space
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final cardData = cards[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LeadOnboardDetailScreen(
                                id: cardData.id,
                                title: cardData.service,
                                imageurl: cardData.filename,
                              ),
                            ),
                          );
                        },
                        child: RestaurantOnboardingCard(
                          title: cardData.service,
                          imageUrl: cardData.filename,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          hintText: "Search Products/ Pincode",
          elevation: WidgetStateProperty.all(2.0),

          backgroundColor: WidgetStateProperty.all(Colors.white),
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          // trailing: <Widget>[
          //   Tooltip(
          //     message: 'Change brightness mode',
          //     child: IconButton(
          //       onPressed: () {
          //         setState(() {
          //           // isDark = !isDark;
          //         });
          //       },
          //       icon: const Icon(Icons.wb_sunny_outlined),
          //       selectedIcon: const Icon(Icons.brightness_2_outlined),
          //     ),
          //   )
          // ],
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }

  Widget filterTypeButtons() {
    return SizedBox(
      height: 40, // Set a height for the horizontal ListView
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.grey[50]),
                  foregroundColor: const WidgetStatePropertyAll(Colors.black)),
              onPressed: () {
                setState(() {});
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.filter_list_outlined,
                    size: 20,
                  ), // Icon at the end of the button
                  SizedBox(width: 8),
                  Text("Filter"),
                  // Spacing between text and icon
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.grey[50]),
                  foregroundColor: const WidgetStatePropertyAll(Colors.black)),
              onPressed: () {
                setState(() {});
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Sort"),
                  // Icon at the end of the button
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 20,
                  ),
                  // Spacing between text and icon
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.grey[50]),
                    foregroundColor:
                        const WidgetStatePropertyAll(Colors.black)),
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Shopping")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.grey[50]),
                    foregroundColor:
                        const WidgetStatePropertyAll(Colors.black)),
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Fuel")),
          ),
        ],
      ),
    );
  }

  Widget MerchantOnboardingCard(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF401B78), // Purple background colorB
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // Icon with green background
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF3BB54A), // Green background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.laptop, // Replace with actual icon if needed
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          //dotted line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(50, (index) {
              return Container(
                width: 4,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4 / 2),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "TOTAL EARNING",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "01",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "TOTAL LEADS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "TOTAL SALES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
