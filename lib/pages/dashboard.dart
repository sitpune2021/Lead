import 'dart:io';

import 'package:bizbooster/models/onboarding.dart';
import 'package:bizbooster/pages/academy_screen.dart';
import 'package:bizbooster/pages/webinar_screen.dart';
import 'package:bizbooster/screens/5xGuarantee/guarantee.dart';
import 'package:bizbooster/screens/build_team/build_team.dart';
import 'package:bizbooster/screens/category_onboarding/category_screen.dart';
import 'package:bizbooster/screens/login/login_screen.dart';
import 'package:bizbooster/screens/my_dashboard_screen/dashboard_screen.dart';
import 'package:bizbooster/screens/my_documents/document_screen.dart';
import 'package:bizbooster/screens/my_kyc/my_kyc_screen.dart';
import 'package:bizbooster/screens/my_lead/my_lead.dart';
import 'package:bizbooster/screens/my_team_lead/my_team_lead_screen.dart';
import 'package:bizbooster/screens/my_wallet/my_wallet.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screen.dart';
import 'package:bizbooster/screens/profile_section/Help_and_Support.dart/support_screen.dart';
import 'package:bizbooster/screens/profile_section/profile_screen.dart';
import 'package:bizbooster/screens/upgrade_package_screen/upgrade_package_screen.dart';
import 'package:bizbooster/services/auth_services.dart';
import 'package:bizbooster/services/session.dart';
import 'package:bizbooster/utils/constant.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:bizbooster/widgets/blockbuster_banking.dart';
import 'package:bizbooster/widgets/blockbuster_branding.dart';
import 'package:bizbooster/widgets/blockbuster_businessservice.dart';
import 'package:bizbooster/widgets/blockbuster_education.dart';
import 'package:bizbooster/widgets/blockbuster_legal_service.dart';
import 'package:bizbooster/widgets/onboarding_card.dart';
import 'package:bizbooster/widgets/pending_verification.dart';
import 'package:bizbooster/widgets/user_alert.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.title});

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      _showNoInternetDialog();
    } else {
      // Optionally check if there's actual internet access
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isEmpty || result[0].rawAddress.isEmpty) {
          _showNoInternetDialog();
        }
      } catch (_) {
        _showNoInternetDialog();
      }
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('No Internet Connection'),
        content:
            const Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  List<String> _getImageSliderList() {
    return [
      'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
      'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR830lWmv7uBP2ECRWTouyh7NRgt5pEO_kbBX_nUXdFt_pQvAzUBLAvLWQe_JOKG0wI9rY&usqp=CAU',
    ];
  }

  final List<Map<String, String>> cardData = [
    {
      "imageurl":
          "https://www.questionpro.com/blog/wp-content/uploads/2022/10/Anas_Meta-image-Template-BLOG-BLOG-4.png",
      "title": "Customer Onboarding 1",
      "earnamount": "Earn Upto 2,000 /-",
    },
    {
      "imageurl":
          "https://5.imimg.com/data5/SELLER/Default/2022/5/RD/MB/IY/14119935/merchant-onboarding-services-500x500.jpeg",
      "title": "Customer Onboarding 2",
      "earnamount": "Earn Upto 3,000 /-",
    },
    {
      "imageurl": "https://via.placeholder.com/300x200.png?text=Customer+3",
      "title": "Customer Onboarding 3",
      "earnamount": "Earn Upto 1,500 /-",
    },
    {
      "imageurl": "https://via.placeholder.com/300x200.png?text=Customer+4",
      "title": "Customer Onboarding 4",
      "earnamount": "Earn Upto 4,000 /-",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color to white
        ),
        title: const Text(
          "Bizbooster",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
            iconSize: 35,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.switch_access_shortcut),
              iconSize: 30,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            iconSize: 30,
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _caurosel() {
    return ListView(
      children: [
        CarouselSlider(
          items: [
            //1st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/franchise.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //2nd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  // image: AssetImage('assets/images/icicibank.jpeg'),
                  image: AssetImage('assets/images/franchise.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //3rd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/food.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //4th Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/franchise.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //5th Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/franchise.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.9,
          ),
        ),
      ],
    );
  }

  Widget _buttonDesign() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('Dashboard', Icons.send, Colors.blue),
            _buildButton('Upgrade Package', Icons.account_balance_wallet,
                Colors.lightBlue),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, IconData icon, Color backgroundColor) {
    return SizedBox(
      child: Container(
        width: 160,
        height: 150,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white.withOpacity(0.3),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This function is moved inside the state class
  Widget _buildUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: _caurosel(),
            ),
            // Space between the carousel and buttons
            // _buttonDesign(),

            // _circularCardView(),
            const SizedBox(height: 0),
            _infoearningImp(context),
            _earning(context),
            _horizontal(context),
            // const SizedBox(height: 30),
            _iconCard(context),
            _lifelinehorizontal(),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 255, 237, 232),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // banner classwidget
                  const BannerWidget(
                    image: "assets/images/merchantonboard.jpeg",
                    height: 180,
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   color: Color.fromARGB(255, 68, 90, 104),
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    // width: double.maxFinite,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Onboarding for Spectacular Deals",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  _businessServicehorizontal(context),
                  // onboarding widget class
                  // const OnboardingGrid(),  // old design
                  SizedBox(
                    height: 311,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 8, right: 8),
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
                  // CustomerOnboardingCard(
                  //   imageurl:
                  //       "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg",
                  //   title: 'CUSTOMER ONBOARDING',
                  //   earnamount: 'Earn Upto 2,000/-',
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 255, 213, 202),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BannerWidget(
                    image: "assets/images/franchise.jpg",
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   color: Color.fromARGB(255, 68, 90, 104),
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    // width: double.maxFinite,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Blockbuster Deals Finance Services",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  BlockbusterBanking(),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 239, 215),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: _caurosel(),
                  ),
                  BlockbusterBusinessservice(),
                ],
              ),
            ),

            BlockbusterBranding(),

            const BlockbusterLegalService(),

            BlockbusterEducation(),

            // __buildServiceCardImp(),
          ],
        ),
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
            GestureDetector(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/startup.png", "Merchant Onboarding"),
            ),
            GestureDetector(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/identification.png", "Seller Onboarding"),
            ),
            GestureDetector(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/qualityservice.png", "Partner Onboarding"),
            ),
            GestureDetector(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/marketing.png", "Customer Onboarding"),
            ),
            GestureDetector(
              onTap: () {
                PendingVerification().showAlert(context);
              },
              child: buildIconColumn(
                  "assets/images/leadership.png", "App Downloads"),
            ),
            // GestureDetector(
            //   onTap: () {
            //     PendingVerification().showAlert(context);
            //   },
            //   child:
            //       buildIconColumn("assets/images/leadership.png", "investment"),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     PendingVerification().showAlert(context);
            //   },
            //   child: buildIconColumn(
            //       "assets/images/leadership.png", "Traditional business"),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildIconColumn(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
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
            width: 90,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
              maxLines: 2, // Limit to 2 lines
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _circularCardView() {
  return SizedBox(
      height: 50, // Set a height for the horizontal ListView
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: _circularCard()),
      ]));
}

Widget _circularCard() {
  return CircleAvatar(
    radius: 46,
    backgroundColor: Colors.red,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(48),
          child: Image.asset('assets/images/franchise.jpg'),
        ),
      ),
    ),
  );
}

Widget _horizontal(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: SizedBox(
      height: 110, // Set a height for the horizontal ListView
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const DocumentScreen()),
              // );
              PendingVerification().showAlert(context);
            },
            child: buildIconColumnnn("assets/images/offer.jpg", "My Offer"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FranchiseScreen()),
              );
            },
            child: buildIconColumnnn("assets/images/kycc.png", "My Package"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Guarantee()),
              );
            },
            child: buildIconColumnnn(
                "assets/images/qualityservice.png", "5XGuarantee"),
          ),
          GestureDetector(
            onTap: () {
              PendingVerification().showAlert(context);
            },
            child:
                buildIconColumnnn("assets/images/marketing.png", "Refer&Earn"),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const BuildTeam()),
              // );

              PendingVerification().showAlert(context);
            },
            child:
                buildIconColumnnn("assets/images/leadership.png", "Build Team"),
          ),
        ],
      ),
    ),
  );
}

// Widget _lifelinehorizontal() {
//   return Padding(
//     padding: const EdgeInsets.only(top: 8.0),
//     child: SizedBox(
//       height: 110, // Set a height for the horizontal ListView
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const OnboardingScreen()),
//               );
//             },
//             child: buildIconColumn("assets/images/file.png", "Onboarding"),
//           ),
//           GestureDetector(
//             onTap: () {
//               UserAlert.showVerificationAlert(context);
//             },
//             child: buildIconColumn(
//                 "assets/images/identification.png", "Business"),
//           ),
//           GestureDetector(
//             onTap: () {
//               UserAlert.showVerificationAlert(context);
//             },
//             child: buildIconColumn(
//                 "assets/images/qualityservice.png", "IT Services"),
//           ),
//           GestureDetector(
//             onTap: () {
//               UserAlert.showVerificationAlert(context);
//             },
//             child:
//                 buildIconColumn("assets/images/marketing.png", "Education"),
//           ),
//           GestureDetector(
//             onTap: () {
//               UserAlert.showVerificationAlert(context);
//             },
//             child: buildIconColumn("assets/images/leadership.png", "Finance"),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// // Widget buildIconColumn(IconData icon, String label) {
// //   return Padding(
// //     padding: const EdgeInsets.all(8.0),
// //     child: Column(
// //       children: [
// //         CircleAvatar(
// //           radius: 30,
// //           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //           child: Icon(icon, size: 30, color: Colors.white),
// //         ),
// //         const SizedBox(height: 8),
// //         Text(
// //           label,
// //           style: const TextStyle(fontSize: 14),
// //           textAlign: TextAlign.center,
// //         ),
// //       ],
// //     ),
// //   );
// // }

Widget buildIconColumnnn(String imagePath, String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2.0), // Padding for the ring thickness
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
          child: Center(
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: 55,
                  height: 55,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Text(
        //   "$label",
        //   style: const TextStyle(fontSize: 14),
        //   textAlign: TextAlign.center,
        // ),
        Container(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
            maxLines: 2, // Limit to 2 lines
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    ),
  );
}

Widget _lifelinehorizontal() {
  return Card(
    // color: Color.fromARGB(255, 255, 239, 215),
    color: Colors.white,
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          FutureBuilder<List<Onboarding>>(
            future: AuthService().fetchOnboardingItem(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No items found'));
              } else {
                List<Onboarding> items = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: SizedBox(
                    height: 115, // Set a height for the horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return GestureDetector(
                          onTap: () {
                            if (item.label == "Onboarding") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // builder: (context) => const OnboardingScreen()),
                                    builder: (context) => CategoryScreen(
                                          id: item.id,
                                        )),
                              );
                            } else {
                              // Show SnackBar for other items
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //     backgroundColor: Colors.white,
                              //     content: Text(
                              //       "Your verification is pending",
                              //       style: TextStyle(color: Colors.black),
                              //     ),
                              //     duration: Duration(seconds: 2),
                              //   ),
                              // );
                              PendingVerification().showAlert(context);
                            }
                          },
                          child: buildIconColumn(item.imagePath, item.label),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    ),
  );
}

Widget buildIconColumn(String imagePath, String label) {
  var id = print("$moduleimageurl$imagePath");
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(
              2.0), // Adjust padding for the ring thickness
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 36, 211, 249),
                Color.fromARGB(255, 210, 36, 249),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network("$moduleimageurl$imagePath",
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70, errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                // You can return any widget here when the image fails to load
                return Icon(
                  Icons.error, // Display an error icon
                  size: 70,
                  color: Colors.red, // Customize the color
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 90,
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

Widget buildIconColumnnew(String imagePath, String label) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      width: 85,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.all(3.0), // Padding for the ring thickness
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 36, 211, 249),
                  Color.fromARGB(255, 210, 36, 249),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  "$moduleimageurl$imagePath",
                  fit: BoxFit.cover,
                  width: 55, // Set the width to fit inside the CircleAvatar
                  height: 55, // Set the height to fit inside the CircleAvatar
                ),
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
              maxLines: 2, // Limit to 2 lines
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _iconCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Way to success.....",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 0),
        SizedBox(
          height: 130,
          child: ListView(
            scrollDirection:
                Axis.horizontal, // Set scroll direction to horizontal
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WebinarScreen()),
                  );
                },
                child: buildIconCard('assets/images/food.jpg', "Webinar"),
              ),
              const SizedBox(width: 10), // Add spacing between items
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AcademyScreen()),
                  );
                },
                child: buildIconCard('assets/images/food.jpg', "Academy"),
              ),
              const SizedBox(width: 10), // Add spacing between items
              GestureDetector(
                onTap: () {
                  PendingVerification().showAlert(context);
                },
                child: buildIconCard('assets/images/franchise.jpg', "My Goal"),
              ),
              const SizedBox(width: 10), // Add spacing between items
              GestureDetector(
                onTap: () {
                  PendingVerification().showAlert(context);
                },
                child: buildIconCard('assets/images/food.jpg', "My Store"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildIconCard(String imagePath, String label) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 80,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(5), // Match the border radius
                child: Image.asset(
                  imagePath, // Replace with your image path
                  height: 80,
                  width: 100,
                  fit: BoxFit.fill,
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
    ),
  );
}

// mylead earning and my team lead are aligned .
Widget _earning(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyWallet()),
            );
          },
          child: _buildCardEarningnew(
              '45687.00',
              'My Earning',
              Colors.blue,
              const Icon(Icons.account_balance_wallet,
                  color: Colors.white, size: 32),
              Color.fromARGB(255, 196, 152, 53)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyLeadPage()),
            );
          },
          child: _buildCardEarningnew(
              '687',
              'My Lead',
              Colors.green,
              const Icon(Icons.leaderboard, color: Colors.white, size: 32),
              Color.fromARGB(255, 0, 123, 9)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyTeamLeadScreen()),
            );
          },
          // child: _buildCardEarningnew('456', 'Team Lead', Colors.green[700]!,
          //     const Icon(Icons.leaderboard, color: Colors.white, size: 32)),
          child: _buildCardEarningnew(
              '456',
              'Team Lead',
              Colors.green[700]!,
              const Icon(Icons.leaderboard, color: Colors.white, size: 32),
              Color.fromARGB(255, 126, 177, 43)),
        ),
      ],
    ),
  );
}

// earning mylaed and my team lead card
Widget _buildCardEarning(String amount, String label, Color color) {
  return ConstrainedBox(
    constraints: const BoxConstraints(
      minHeight: 70, // Minimum height
      maxHeight: 100, // Maximum height
    ),
    child: Container(
      width: 130, // Adjust width as needed
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 14, color: color, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildCardEarningnew(
    String amount, String label, Color color, Icon icon, Color bgcolor) {
  return Container(
    width: 125,
    padding: const EdgeInsets.only(top: 8, left: 0, right: 0, bottom: 0),
    decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon with Circle Background
        Column(
          children: [
            Text(
              amount,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        ),
        const SizedBox(height: 2),
        // Label Text
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
          decoration: BoxDecoration(
              color: bgcolor,
              // color: Color.fromARGB(255, 196, 152, 53),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey)),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Amount Text
      ],
    ),
  );
}

// not in use.
Widget __buildServiceCardImp() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recharge & Pay Bills",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.purple),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildServiceCard(Icons.mobile_friendly, "Mobile Recharge"),
              _buildServiceCard(Icons.monetization_on, "Loan\n Repayment"),
              _buildServiceCard(Icons.credit_card, "Credit Card Payment"),
              _buildServiceCard(Icons.house, "Rent"),
            ],
          ),
        ),
      ],
    ),
  );
}

// not in use.
Widget _buildServiceCard(IconData icon, String label) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8.0),
        width: 70, // Set a fixed width
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.purple),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.purple),
              textAlign: TextAlign.center,
              maxLines: 2, // Allow a maximum of 2 lines
              overflow: TextOverflow.visible, // Make overflow visible
            ),
          ],
        ),
      ),
    ],
  );
}

// this is for dashboard and upgrade package
Widget _infoearningImp(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              child: _infoearning(
                  "Dashboard", Colors.blue[200]!, "", Icons.dashboard),
            ),
          ), // Expands to fill available space
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FranchiseScreen()),
                );
              },
              child: _infoearning(
                  "Upgrade Package", Colors.blue[200]!, "", Icons.update),
            ),
          ), // Space between the two containers
          // Expanded(
          //     child: _infoearning("Upgrade Package", Colors.blue[200]!, "",
          //         Icons.update)), // Second info widget
        ],
      ),
    ],
  );
}

// this is for dashboard and upgrade package.
Widget _infoearning(String money, Color color, String title, IconData icon) {
  return SafeArea(
    child: Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis, // Handle overflow
                    maxLines: 1,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    // Icons.update_rounded, // You can choose a custom icon here
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                money,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Widget _phonepaycarousel(BuildContext context) {
//   return CustomScrollView(
//     slivers: [
//       SliverToBoxAdapter(
//         child: Stack(
//           children: <Widget>[
//             // Carousel Slider
//             Container(
//               height: MediaQuery.of(context).size.width / 3.0,
//               width: MediaQuery.of(context).size.width,
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                   aspectRatio: 2,
//                   viewportFraction: 1.0,
//                   initialPage: 0,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 2),
//                   autoPlayAnimationDuration:
//                       const Duration(milliseconds: 800),
//                   enlargeCenterPage: true,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _currentIndex = index;
//                     });
//                   },
//                 ),
//                 items: _getImageSliderList().map((imagePath) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Image.network(
//                         imagePath,
//                         fit: BoxFit.cover,
//                         width: MediaQuery.of(context).size.width,
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//             ),

//             // Dot Indicators
//             Positioned(
//               bottom: 5.0,
//               right: 0.0,
//               left: 0.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   _getImageSliderList().length,
//                   (index) => dots(_currentIndex, index),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

//   Widget dots(int currentIndex, int index) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4.0),
//       width: currentIndex == index ? 10.0 : 6.0,
//       height: currentIndex == index ? 10.0 : 6.0,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: currentIndex == index ? Colors.blue : Colors.grey,
//       ),
//     );
//   }
// }

//session logout dialog
Future<void> showLogoutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap a button
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
          TextButton(
            child: const Text('Log Out'),
            onPressed: () async {
              Session.logout();
              Navigator.of(context).pop(); // Dismiss the dialog
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: Text(
          "Marketing",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
