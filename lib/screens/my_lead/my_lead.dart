import 'package:bizbooster/screens/my_lead/components/my_lead_card.dart';
import 'package:bizbooster/screens/my_lead_report/my_lead_report_screen.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class MyLeadPage extends StatefulWidget {
  const MyLeadPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyLeadPageState();
  }
}

class _MyLeadPageState extends State<MyLeadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Lead"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  // This function is moved inside the state class
  Widget _buildUI() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const BannerWidget(
              image: "assets/images/franchise.jpg",
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft, // Align text to start (left)
                  child: Text(
                    "My Lead Category ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // color: Color.fromARGB(255, 4, 74, 6),
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LeadReportScreen()),
                    );
                  },
                  child: const MyLeadCard(),
                ),
                MyLeadCard(),
                MyLeadCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
