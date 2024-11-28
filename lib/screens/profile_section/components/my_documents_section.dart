import 'package:bizbooster/screens/my_documents/document_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDocumentsSection extends StatelessWidget {
  const MyDocumentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMyDocumentsHeader(),
        _buildDocumentsCard(context),
        _buildMoreHeader(),
        _buildMoreCard(context),
        _buildJoinUsSection(),
        _buildSocialMediaIcons(),
        _buildAppVersionInfo(),
      ],
    );
  }

  Widget _buildMyDocumentsHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "My Documents",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDocumentsCard(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.description, color: Colors.blue),
            title: const Text("Documents"),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              // Handle document tap
              Future.delayed(const Duration(milliseconds: 300), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentScreen()),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMoreHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "More",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildMoreCard(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Column(
        children: [
          _buildChangeLanguageTile(context),
          // const Divider(), // Divider between tiles
          _buildTermsAndConditionsTile(context),
          // const Divider(), // Divider between tiles
          _buildPrivacyPolicyTile(context),
        ],
      ),
    );
  }

  Widget _buildChangeLanguageTile(BuildContext context) {
    return ListTile(
      // leading: Icon(Icons.langu, color: Colors.blue),
      leading: FaIcon(FontAwesomeIcons.language, color: Colors.blue),
      title: const Text("Change language"),
      trailing: const Text("English"),
      onTap: () {
        // Handle language change
      },
    );
  }

  Widget _buildTermsAndConditionsTile(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.policy, color: Colors.blue),
      title: const Text("Terms & Conditions"),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: () {
        // Handle Terms & Conditions
      },
    );
  }

  Widget _buildPrivacyPolicyTile(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.privacy_tip, color: Colors.blue),
      title: const Text("Privacy Policy"),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: () {
        // Handle Privacy Policy
      },
    );
  }

  Widget _buildJoinUsSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Text(
          "Join us",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildAppVersionInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Text(
          "Bizbooster2x\nv 5.09.09",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, color: Colors.grey),
        ),
      ),
    );
  }
}

Widget _buildSocialMediaIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.youtube,
          color: Colors.red,
          size: 30,
        ),
        onPressed: () {
          // Handle YouTube link
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.facebook,
          color: Colors.blue,
          size: 30,
        ),
        onPressed: () {
          // Handle Facebook link
        },
      ),
      IconButton(
        icon: FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
          size: 30,
        ),
        onPressed: () {
          // Handle Twitter link
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.camera_alt,
          color: Colors.blue,
          size: 30,
        ),
        onPressed: () {
          // Handle Instagram link
        },
      ),
      IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.telegram,
          color: Colors.blue,
          size: 30,
        ),
        onPressed: () {
          // Handle Telegram link
        },
      ),
    ],
  );
}
