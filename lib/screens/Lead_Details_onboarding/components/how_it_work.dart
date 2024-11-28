import 'package:bizbooster/screens/Lead_Details_onboarding/model/restaurant_onboarding_model';
import 'package:bizbooster/services/auth_services.dart';
import 'package:flutter/material.dart';

class HowItWork extends StatefulWidget {
  final String id;
  const HowItWork({Key? key, required this.id}) : super(key: key);

  @override
  _HowItWorkState createState() => _HowItWorkState();
}

class _HowItWorkState extends State<HowItWork> {
  late Future<List<ServiceLeadProduct>> futureServiceLeadProduct;

  @override
  void initState() {
    super.initState();
    futureServiceLeadProduct = AuthService().fetchServiceLeadProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceLeadProduct>>(
      future: futureServiceLeadProduct,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          final serviceLeadProduct = snapshot.data!.first;
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
                      "How it works?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      serviceLeadProduct.howitworks ??
                          "No description available.",
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
