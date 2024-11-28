import 'package:flutter/material.dart';

class NonIndividualKyc extends StatefulWidget {
  const NonIndividualKyc({super.key});

  @override
  _NonIndividualKycState createState() => _NonIndividualKycState();
}

class _NonIndividualKycState extends State<NonIndividualKyc> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const BannerWidget(),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: ' Enter Company Pan Number',
            prefixIcon: Icons.phone,
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Enter Company Name',
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
                  hintText: 'Enter Company Type',
                  prefixIcon: Icons.person,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Upload Company Pan Card',
            prefixIcon: Icons.phone,
          ),
          const SizedBox(height: 5.0),
          Divider(
            color: Colors.orange[300],
          ),

          const SizedBox(height: 16.0),

          // Row(
          //   children: [
          //     Expanded(
          //       child: _buildTextField(
          //         hintText: 'Enter Mail ID',
          //         prefixIcon: Icons.person,
          //       ),
          //     ),
          //     const SizedBox(width: 8.0),
          //     Expanded(
          //       child: _buildTextField(
          //         hintText: 'Select Qualification',
          //         prefixIcon: Icons.person,
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Enter Company Bank Account Number ',
            prefixIcon: Icons.phone,
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Enter Bank IFSC Code ',
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 5.0),
          Divider(
            color: Colors.orange[300],
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Enter GST Number ',
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hintText: 'Upload  GST Certificate',
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 5.0),
          Divider(
            color: Colors.orange[300],
          ),
          const SizedBox(height: 16.0),

          _buildTextField(
            hintText: 'Enter Adhar Card Number ',
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 16.0),

          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  hintText: 'Front Side Adhar Card',
                  prefixIcon: Icons.person,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: _buildTextField(
                  hintText: 'Back Side Adhar Card',
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
