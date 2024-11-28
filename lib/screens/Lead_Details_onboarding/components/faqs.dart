import 'package:bizbooster/screens/Lead_Details_onboarding/model/restaurant_onboarding_model';
import 'package:bizbooster/services/auth_services.dart';
import 'package:flutter/material.dart';

class Faqs extends StatefulWidget {
  final String id;
  const Faqs({Key? key, required this.id}) : super(key: key);

  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  late Future<List<ServiceLeadProduct>> _serviceLeadProductsFuture;

  @override
  void initState() {
    super.initState();
    _serviceLeadProductsFuture = AuthService()
        .fetchServiceLeadProduct(widget.id); // Initialize data fetch
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
                      "FAQs",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "${product.faqs}", // Replace 'description' with the appropriate field from ServiceLeadProduct
                      textAlign: TextAlign.justify,
                    ),
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
