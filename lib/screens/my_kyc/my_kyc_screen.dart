import 'package:bizbooster/screens/my_kyc/components/non_individual_kyc.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class MyKycScreen extends StatefulWidget {
  const MyKycScreen({super.key});

  @override
  _MyKycScreenState createState() => _MyKycScreenState();
}

class _MyKycScreenState extends State<MyKycScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Individual KYC",
              ),
              Tab(
                text: "Non-Individual KYC",
              ),
            ],
          ),
          title: const Text('KYC'),
          // centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            _individualKycFormContent(), // Content for the "Learn" tab
            const NonIndividualKyc()
          ],
        ),
      ),
    );
  }

  // Separate method for building the form content to keep the code organized
  Widget _individualKycFormContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BannerWidget(
            image: "assets/images/franchise.jpg",
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  hintText: 'Enter Pan Card Number',
                  prefixIcon: Icons.phone,
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Add your on pressed event here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(50, 55), // Set width and height equal
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Name As Per Pan Card',
            prefixIcon: Icons.phone,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  hintText: 'Enter date Of birth',
                  prefixIcon: Icons.person,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: _buildTextField(
                  hintText: 'Enter Mobile Number',
                  prefixIcon: Icons.person,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  hintText: 'Enter Mail ID',
                  prefixIcon: Icons.person,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: _buildTextField(
                  hintText: 'Select Qualification',
                  prefixIcon: Icons.person,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Select Occupation',
            prefixIcon: Icons.phone,
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Enter Full Address',
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  hintText: 'Enter Pincode',
                  prefixIcon: Icons.person,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: _buildTextField(
                  hintText: 'Select City',
                  prefixIcon: Icons.person,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  hintText: 'Select District',
                  prefixIcon: Icons.person,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: _buildTextField(
                  hintText: 'Select State',
                  prefixIcon: Icons.person,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Sign-up action
              },
              style: ElevatedButton.styleFrom(
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Submit Details',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Need help action
              },
              style: ElevatedButton.styleFrom(
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 1, color: Color.fromARGB(255, 121, 191, 248)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Need Help',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue[100]!,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  // Helper method for creating text fields
  Widget _buildTextField({
    required String hintText,
    IconData? prefixIcon,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        // prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
