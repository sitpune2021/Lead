import 'package:bizbooster/screens/Lead_Details_onboarding/model/restaurant_onboarding_model';
import 'package:bizbooster/services/auth_services.dart';
import 'package:bizbooster/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DocumentEligiblity extends StatefulWidget {
  final String id;
  const DocumentEligiblity({Key? key, required this.id}) : super(key: key);

  @override
  _DocumentEligiblityState createState() => _DocumentEligiblityState();
}

class _DocumentEligiblityState extends State<DocumentEligiblity> {
  late Future<List<ServiceLeadProduct>> _serviceLeadProductsFuture;
  bool _isDownloading = false; // Track download state

  @override
  void initState() {
    super.initState();
    _serviceLeadProductsFuture = AuthService()
        .fetchServiceLeadProduct(widget.id); // Initialize data fetch
  }

  Future<void> downloadPdf(String url, String fileName) async {
    try {
      // Set downloading state to true
      setState(() {
        _isDownloading = true;
      });

      // Get the Downloads directory (on Android 10+)
      final directory = Directory("/storage/emulated/0/Download");
      if (directory == null) {
        throw Exception("Unable to get external storage directory");
      }

      // Construct the path for saving the file
      String savePath =
          "${directory.path}/$fileName"; // Saving to "Download" folder
      print(savePath);

      // Create Dio instance for downloading the file
      Dio dio = Dio();

      // Start downloading the PDF
      await dio.download(url, savePath);

      // Notify the user once the download is complete
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download complete")),
      );
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error downloading file: $e")),
      );
    } finally {
      // Reset downloading state to false once the download is complete
      setState(() {
        _isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceLeadProduct>>(
      future: _serviceLeadProductsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No data available"));
        } else {
          // Assuming you want the first product in the list
          final product = snapshot.data!.first;

          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Document & Eligibility",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "${product.documentdescription}",
                      style: const TextStyle(height: 2.0),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        "Check if the product is available in your city"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter Pincode",
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Check",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 247, 153, 56),
                            ),
                            child: const Text(
                              "Learn More >>",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: _isDownloading
                                ? null // Disable button while downloading
                                : () {
                                    // Assuming the PDF URL is in the 'documentfilepath' property
                                    if (product.documentfilepath != null) {
                                      downloadPdf(
                                          "$leaddetailproductdetalis${product.documentfilename}",
                                          "${product.documentfilename}.pdf");
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                            ),
                            icon: const Icon(Icons.picture_as_pdf,
                                color: Colors.white),
                            label: _isDownloading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Download Pdf",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
