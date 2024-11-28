import 'package:bizbooster/screens/Certification/components/certification_tile.dart';
import 'package:bizbooster/screens/Certification/components/in_process_tile.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  String _mealType = "AllCourses";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _buildUI()),
    );
  }

  // This function is moved inside the state class
  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _horizontalTypeButtons(),
          ),
          if (_mealType == "AllCourses") _buildCertificationTiles(),
          if (_mealType == "InProcess") _buildInProcessTile(),
        ],
      ),
    );
  }

  Widget _horizontalTypeButtons() {
    final List<Map<String, String>> buttons = [
      {"label": "All Courses", "type": "AllCourses"},
      {"label": "In Process", "type": "InProcess"},
      {"label": "Completed", "type": "Completed"},
    ];

    return SizedBox(
      height: 40, // Set a height for the horizontal ListView
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: buttons.map((button) {
          final bool isSelected = _mealType == button["type"];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _mealType = button["type"]!;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: isSelected ? Colors.blue : Colors.white,
                foregroundColor: isSelected ? Colors.white : Colors.black,
                side: BorderSide(
                  color: isSelected ? Colors.blue : Colors.grey,
                  width: 1.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(button["label"]!),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCertificationTiles() {
    final List<Map<String, String>> courses = [
      {
        "title": "How to grow with BankSathi?(Updated)",
        "description":
            "Start Your Business with Zero Investment and Earn over ₹1,00,000 Every Month. Provide financial advice and products to the customers and get a fast payout every month.",
        "chapters": "10 Chapters",
        "completed": "6963 People Completed",
        "imageUrl":
            "https://via.placeholder.com/150", // Replace with actual image
      },
      {
        "title": "How to grow with BankSathi?(Updated)",
        "description":
            "Start Your Business with Zero Investment and Earn over ₹1,00,000 Every Month. Provide financial advice and products to the customers and get a fast payout every month.",
        "chapters": "5 Chapters",
        "completed": "7241 People Completed",
        "imageUrl":
            "https://via.placeholder.com/150", // Replace with actual image
      },
      // Add more courses here
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CertificationTile(
              title: course["title"]!,
              description: course["description"]!,
              chapters: course["chapters"]!,
              completed: course["completed"]!,
              imageUrl: course["imageUrl"]!,
            ),
          );
        },
      ),
    );
  }

  Widget _buildInProcessTile() {
    final List<Map<String, String>> inProcessCourses = [
      {
        "title": "How to Sell Insurance?",
        "progress": "2% Completed",
        "completed": "1781 people completed",
        "imageUrl":
            "https://via.placeholder.com/150", // Replace with actual URL
        "points": "1000",
      },
      {
        "title": "Learn Financial Planning",
        "progress": "50% Completed",
        "completed": "2435 people completed",
        "imageUrl":
            "https://via.placeholder.com/150", // Replace with actual URL
        "points": "2000",
      },
      // Add more courses here
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: inProcessCourses.length,
        itemBuilder: (context, index) {
          final course = inProcessCourses[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: InProcessTile(
              title: course["title"]!,
              progress: course["progress"]!,
              completed: course["completed"]!,
              imageUrl: course["imageUrl"]!,
              points: course["points"]!,
            ),
          );
        },
      ),
    );
  }
}
