import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class WebinarScreen extends StatefulWidget {
  const WebinarScreen({super.key});

  @override
  _WWebinarScreenState createState() => _WWebinarScreenState();
}

class _WWebinarScreenState extends State<WebinarScreen> {
  int _currentToggleIndex = 0; // Track the current toggle index

  final List<Map<String, String>> webinars = [
    {
      "title": "How to Earn up to 1 lakh rupees With Profinitiy",
      "subtitle":
          "Earn up to Rs1 lakh with Profinitiy—your gateway to financial success",
      "date": "07-Oct-2024 | 12:00 PM - 1:00 PM",
    },
    {
      "title": "Expand your Business Pan India",
      "subtitle": "Unlock endless opportunities and grow your reach nationwide",
      "date": "08-Oct-2024 | 12:00 PM - 1:00 PM",
    },
    {
      "title": "Expand your Business Pan India",
      "subtitle": "Unlock endless opportunities and grow your reach nationwide",
      "date": "08-Oct-2024 | 12:00 PM - 1:00 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webinar'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const BannerWidget(
            image: "assets/images/franchise.jpg",
          ),
          const SizedBox(height: 5.0),
          Center(
            child: ToggleSwitch(
              minWidth: double.infinity,
              cornerRadius: 20.0,
              activeBgColors: const [
                [Color.fromARGB(255, 26, 38, 86)],
                [Color.fromARGB(255, 26, 38, 86)],
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.orange,
              inactiveFgColor: Colors.white,
              initialLabelIndex: _currentToggleIndex,
              totalSwitches: 2,
              labels: const ['Webinar', 'Recorded Webinar'],
              radiusStyle: true,
              onToggle: (index) {
                setState(() {
                  _currentToggleIndex =
                      index!; // Update the current toggle index
                });
                // print('switched to: $index');
              },
            ),
          ),
          const SizedBox(height: 5.0), // Add spacing before ListView
          Expanded(
            // Use Expanded to avoid layout issues
            child: _currentToggleIndex == 0
                ? ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: webinars.length,
                    itemBuilder: (context, index) {
                      final webinar = webinars[index];
                      return WebinarCard(
                        title: webinar["title"]!,
                        subtitle: webinar["subtitle"]!,
                        date: webinar["date"]!,
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No Recorded Webinars Available',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class WebinarCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;

  const WebinarCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 249, 214, 168),
            Color.fromARGB(255, 255, 252, 245),
          ], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/lifelinecart.png'), // Sample image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      'Mr. Swapnil Tiwari\n(Team Profinitiy)',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center, // Center align text
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                // Use Expanded to fill available space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      date,
                      style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 114, 0),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: const Text('Enroll Now'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisSize: MainAxisSize
                                .min, // Size to fit the text and icon
                            children: [
                              Text(
                                'INVITE',
                              ),
                              SizedBox(width: 5), // Space between text and icon
                              Icon(
                                Icons.share,
                                size: 20,
                                color: Color.fromARGB(255, 255, 114, 0),
                              ), // Share icon
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
