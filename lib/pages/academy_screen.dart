import 'package:bizbooster/screens/Certification/certification_screen.dart';
import 'package:bizbooster/widgets/pending_verification.dart';
import 'package:flutter/material.dart';

class AcademyScreen extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {'icon': Icons.star, 'label': 'Premium Courses'},
    {'icon': Icons.book, 'label': 'Selected Courses'},
    {'icon': Icons.school, 'label': 'Learning Path', 'badge': 'Resume'},
    {'icon': Icons.library_books, 'label': 'All Courses'},
    {'icon': Icons.assignment, 'label': 'Real Claim Stories'},
    {'icon': Icons.web, 'label': 'Webinar'},
    {'icon': Icons.verified, 'label': 'Certification'},
    {'icon': Icons.flash_on, 'label': 'Gyan in 2 mins'},
    {'icon': Icons.quiz, 'label': 'Quiz Center', 'badge': 'New'},
  ];

  AcademyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Learn",
                ),
                Tab(
                  text: "Reels",
                ),
                // Tab(icon: Icon(Icons.music_video)),
              ],
            ),
            title: const Text('Academy'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search Icon',
                onPressed: () {},
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Explore Academy',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                3, // 3 columns as per the image layout
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 30.0,
                          ),
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            // return OptionTile(
                            //   icon: options[index]['icon'],
                            //   label: options[index]['label'],
                            //   badge: options[index]['badge'],
                            // );

                            return GestureDetector(
                                onTap: () {
                                  // Handle your click action here

                                  if (options[index]['label'] ==
                                      "Certification") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CertificationScreen()),
                                    );
                                  } else {
                                    PendingVerification().showAlert(context);
                                  }
                                },
                                child: OptionTile(
                                  icon: options[index]['icon'],
                                  label: options[index]['label'],
                                  badge: options[index]['badge'],
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ), // Replace with your content
              const Center(child: Text('')), // Replace with your content
            ],
          ),
        ));
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? badge;

  const OptionTile(
      {super.key, required this.icon, required this.label, this.badge});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 30,
                  color: Theme.of(context).colorScheme.inversePrimary),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.clip),
              ),
            ],
          ),
        ),
        if (badge != null)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: badge == 'New' ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge!,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
      ],
    );
  }
}
