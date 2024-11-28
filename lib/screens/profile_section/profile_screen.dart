import 'package:bizbooster/models/users.dart';
import 'package:bizbooster/screens/my_wallet/my_wallet.dart';
import 'package:bizbooster/screens/profile_section/Help_and_Support.dart/support_screen.dart';
import 'package:bizbooster/screens/profile_section/Refer_and_earn/refer_and_earn.dart';
import 'package:bizbooster/screens/profile_section/components/dashboard_card.dart';
import 'package:bizbooster/screens/profile_section/components/frenchise_card.dart';
import 'package:bizbooster/screens/profile_section/components/my_documents_section.dart';
import 'package:bizbooster/screens/profile_section/components/my_team_lead_card.dart';
import 'package:bizbooster/screens/profile_section/components/profile_card.dart';
import 'package:bizbooster/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final fetchedUser = await AuthService().fetchUser();
    setState(() {
      user = fetchedUser;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Profile"),
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        // Make the content scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileCard(context, user?.name ?? 'Unknown', user?.mobileno ?? '',
                user?.filename ?? ''),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dashboardCard(
                  title: "My Earning",
                  value: "45687.00",
                  valueColor: Colors.green,
                  onTap: () {
                    // You can add navigation to My Earning screen if needed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyWallet()),
                    );
                  },
                ),
                dashboardCard(
                  title: "Refer & Earn",
                  icon: Icons.people_outline,
                  onTap: () {
                    // Navigate to the Refer and Earn screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReferAndEarnScreen()),
                    );
                  },
                ),
                dashboardCard(
                  title: "Support",
                  icon: Icons.help_outline,
                  onTap: () {
                    // Navigate to the Support screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SupportScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),
            myTeamLeadCard(context),
            const SizedBox(height: 20),
            const FranchiseSection(),
            const SizedBox(height: 20),
            const MyDocumentsSection(), // Add the new section here
          ],
        ),
      ),
    );
  }
}
