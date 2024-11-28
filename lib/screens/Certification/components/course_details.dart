import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  // Sample data for chapters
  final List<Map<String, dynamic>> chapters = [
    {
      "image": "",
      "number": "Chapter 1",
      "title": "Fundamentals of Sales",
      "status": "unlocked",
    },
    {
      "image":
          "https://media.instahyre.com/images/profile/base/employer/9206/2d72de0633/gromo_logo_square_2.webp",
      "number": "Chapter 2",
      "title": "What is Insurance? 3 Types of Insurance & Why do we need it?",
      "status": "locked",
    },
    {
      "image":
          "https://media.instahyre.com/images/profile/base/employer/9206/2d72de0633/gromo_logo_square_2.webp",
      "number": "Chapter 2",
      "title": "What is Insurance? 3 Types of Insurance & Why do we need it?",
      "status": "locked",
    },
    {
      "image":
          "https://media.instahyre.com/images/profile/base/employer/9206/2d72de0633/gromo_logo_square_2.webp",
      "number": "Chapter 2",
      "title": "What is Insurance? 3 Types of Insurance & Why do we need it?",
      "status": "locked",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Course Details"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Details Card
              Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Banner
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/franchise.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text(
                              "1781 people completed",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Course Description
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How to Sell Insurance?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Do you want to become a successful insurance agent? Complete this free course and learn the fundamentals of selling insurance.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 18),
                                  SizedBox(width: 4),
                                  Text(
                                    "40 min",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Icon(Icons.language, size: 18),
                                  FaIcon(
                                    FontAwesomeIcons.language,
                                    size: 18,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "en",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.book, size: 18),
                                  SizedBox(width: 4),
                                  Text(
                                    "7 Chapters",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 238, 247, 255),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Free",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      color: Colors.yellow[700],
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Earn 1000",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.yellow[700],
                                        fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
              // const SizedBox(height: 16),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: const Text(
                  "Course Content",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Course Content List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  return ChapterTile(
                    chapterNumber: chapter["number"],
                    chapterTitle: chapter["title"],
                    isLocked: chapter["status"] == "locked",
                    image: chapter["image"],
                  );
                },
              ),
              const SizedBox(height: 16),
              // Download Certificate Button
              Center(
                child: ElevatedButton(
                  onPressed: null, // Disabled button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  child: const Text(
                    "Download Certificate",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class ChapterTile extends StatelessWidget {
  final String? image; // Nullable type
  final String? chapterNumber; // Nullable type
  final String? chapterTitle; // Nullable type
  final bool isLocked;

  const ChapterTile({
    Key? key,
    required this.image,
    required this.chapterNumber,
    required this.chapterTitle,
    this.isLocked = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Leading Icon/Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: Image.network(
                  width: 100,
                  height: 100,
                  image ?? 'assets/images/placeholder.png', // Fallback image
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Chapter Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapterNumber ??
                        "Unknown Chapter", // Fallback chapter number
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chapterTitle ?? "Untitled Chapter", // Fallback title
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Trailing Play/Lock Icon
            Icon(
              isLocked ? Icons.lock : Icons.play_circle_fill,
              color: isLocked ? Colors.grey : Colors.green,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
