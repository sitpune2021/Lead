import 'package:bizbooster/screens/category_onboarding/model/OnboardingCategory.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screen.dart';
import 'package:bizbooster/services/auth_services.dart';
import 'package:bizbooster/utils/constant.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String id;
  const CategoryScreen({super.key, required this.id});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List cards = [
    const _OnboardingCard(
      imagePath: "assets/images/LocalB.jpg",
      label: "Merchant Onboarding",
    ),
    const _OnboardingCard(
      imagePath: "assets/images/LocalB.jpg",
      label: "Seller Onboarding",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Onboarding'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const BannerWidget(image: "assets/images/franchise.jpg"),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<OnboardingCategory>>(
                future: AuthService().fetchCategories(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                            'Error: ${snapshot.error ?? 'Unknown error'}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('No Onboarding Categories found'));
                  } else {
                    List<OnboardingCategory> categories = snapshot.data!;
                    return GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final item = categories[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnboardingScreen(
                                  id: item.id,
                                  title: item.category,
                                ),
                              ),
                            );
                          },
                          child: _OnboardingCard(
                            imagePath: item.filename,
                            label: item.category,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(String? imageUrl) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    width: 200,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: Colors.white,
                        size: 40,
                      );
                    },
                  )
                : const Icon(
                    Icons.image_not_supported, // Default icon if image is null
                    color: Colors.white,
                    size: 40,
                  ),
          ),
          const SizedBox(height: 8),
          const Expanded(
            child: Text(
              textAlign: TextAlign.center,
              'Merchant \nOnboarding',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingCard extends StatelessWidget {
  final String imagePath;
  final String label;

  const _OnboardingCard(
      {required this.imagePath, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // decoration: BoxDecoration(
    //   //   borderRadius: BorderRadius.circular(12),
    //   //   border: Border.all(color: Colors.grey),
    //   // ),

    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(8),
    //         child: Image.network(
    //           "$categoryimageurl$imagePath",
    //           height: 100,
    //           width: 150,
    //           fit: BoxFit.fill,
    //         ),
    //       ),
    //       const SizedBox(height: 8),
    //       Expanded(
    //         child: SizedBox(
    //           height: 100,
    //           width: 100,
    //           child: Text(
    //             label,
    //             style: const TextStyle(
    //               fontSize: 14,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.black,
    //             ),
    //             textAlign: TextAlign.center,
    //             maxLines: 2, // Limit to 2 lines
    //             overflow: TextOverflow.ellipsis,
    //             softWrap: true,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon container
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "$categoryimageurl$imagePath",
                    height: 80,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 8),
                // Text label
                SizedBox(
                  width: 100,
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2, // Limit to 2 lines
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
