import 'package:bizbooster/screens/login/login_screen.dart';
import 'package:bizbooster/screens/my_kyc/my_kyc_screen.dart';
import 'package:bizbooster/screens/profile_section/Basic_Profile_Information/basic_profile_screen.dart';
import 'package:bizbooster/services/session.dart';
import 'package:flutter/material.dart';

class ProfileCardScreen extends StatelessWidget {
  final String name;
  final String mobileno;
  final String image;

  const ProfileCardScreen(
      {super.key,
      required this.name,
      required this.mobileno,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Profile"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            // The scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Header
                    Card(
                      color: Colors.white,
                      elevation: 3,
                      margin: EdgeInsets.zero, // Remove default margin
                      child: Padding(
                        padding: const EdgeInsets.all(
                            16.0), // Adjust padding for uniform spacing
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment
                              .stretch, // Center-align horizontally
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Outer circle
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue[50],
                                    border: Border.all(
                                        color: Colors.green, width: 3),
                                  ),
                                ),
                                // Icon
                                // const Icon(
                                //   Icons.person,
                                //   size: 60,
                                //   color: Colors.blueGrey,
                                // ),
                                ClipOval(
                                  child: Image.network(
                                    "http://43.205.22.150:5000/users/$image",
                                    width: 96,
                                    height: 96,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 96,
                                        height: 96,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue[50],
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          size: 60,
                                          color: Colors.blueGrey,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                                height:
                                    16), // Spacing between circle and content
                            Text(
                              name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              mobileno,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize:
                                  MainAxisSize.min, // Align items closely
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 18,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Super Franchise",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 100, 97, 97),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Profile Information Section
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(Icons.info, color: Colors.blue),
                        title: const Text("Basic Profile Information"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 5),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                        // onTap: () {
                        //   // Handle tap
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const BasicProfileScreen()),
                        //   );
                        // },
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyKycScreen()),
                            );
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),

                    // KYC Section with Video Icon and Complete KYC Text
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "KYC",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "How to Complete KYC",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // KYC Card
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading:
                            const Icon(Icons.credit_card, color: Colors.blue),
                        title: const Text("Identity Details"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 8),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                        onTap: () {
                          // Handle tap
                        },
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(Icons.account_balance,
                            color: Colors.blue),
                        title: const Text("Bank Details"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 8),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                        onTap: () {
                          // Handle tap
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Text(
                          "Exit",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    //Delete My Account
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Colors.blue),
                        title: const Text("Delete Account"),
                        trailing: const Row(
                          mainAxisSize: MainAxisSize.min,
                        ),
                        onTap: () {
                          // Handle tap
                          // showLogoutDialog(context);
                        },
                      ),
                    ),

                    // Log Out Button at the Bottom
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Colors.blue),
                        title: const Text("Log Out"),
                        trailing: const Row(
                          mainAxisSize: MainAxisSize.min,
                        ),
                        onTap: () {
                          // Handle tap
                          showLogoutDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

Future<void> showLogoutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap a button
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you sure you want to log out?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
          TextButton(
            child: const Text('Log out'),
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
