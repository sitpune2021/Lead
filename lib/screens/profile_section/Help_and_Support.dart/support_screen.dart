import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Support"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help & Support',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              supportOption('Help', 'Popular FAQs', Icons.help_outline),
              supportOption('Chat with Us', 'Instant Support', Icons.chat),
              supportOption('Phone Support', '9 AM - 6 PM', Icons.phone),
              supportOption(
                  'WhatsApp Support',
                  'Fast Reply in 5 Minutes (Indian Users only)',
                  FontAwesomeIcons.whatsapp),
              supportOption(
                  'Email Support', 'Response within 24 Hours', Icons.email),
            ],
          ),
        ),
      ]),
    );
  }

  Widget supportOption(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        // Add functionality if needed
      },
    );
  }
}
