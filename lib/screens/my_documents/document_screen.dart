import 'package:bizbooster/screens/my_documents/components/document_item.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Documents"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BannerWidget(
                image: "assets/images/franchise.jpg",
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "My Documents",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 0.3,
                  childAspectRatio: 0.7,
                  children: [
                    buildDocumentItem("ID Card", "assets/images/document.png"),
                    buildDocumentItem(
                        "Certificate", "assets/images/document.png"),
                    buildDocumentItem(
                        "Appointment letter", "assets/images/document.png"),
                    buildDocumentItem(
                        "Franchise Agreement", "assets/images/document.png"),
                    buildDocumentItem("Bill", "assets/images/document.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build each document item
  Widget buildDocumentItem(String title, String imagePath) {
    return AspectRatio(
      aspectRatio: 0.8, // Adjust as needed
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 140,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.yellow[50],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 8.0), // Add spacing to prevent crowding
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[100],
                // padding:
                //     const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(color: Colors.blue.shade200),
                ),
              ),
              onPressed: () {
                // Add download functionality here
              },
              child: const Text(
                'DOWNLOAD',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
