import 'package:bizbooster/screens/upgrade_package_screen/components/franchise_card.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class FranchiseScreen extends StatelessWidget {
  final List<FranchiseOffer> offers = [
    FranchiseOffer(
      title: 'FBA',
      duration: 'Lifetime',
      price: '3499/-',
      image: 'assets/images/icicibank.jpeg', // Replace with your image path
    ),
    FranchiseOffer(
      title: 'Premium Franchise',
      duration: '3 YEARS',
      price: '99,999/-',
      image: 'assets/images/franchise.jpg', // Replace with your image path
    ),
    FranchiseOffer(
      title: 'Super Franchise',
      duration: '3 YEARS',
      price: '49,999/-',
      image: 'assets/images/franchise.jpg', // Replace with your image path
    ),
    FranchiseOffer(
      title: 'Franchise',
      duration: '5 YEARS',
      price: '9,999/-',
      image: 'assets/images/icicibank.jpeg', // Replace with your image path
    ),
  ];

  FranchiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade Packages'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerWidget(
              image: "assets/images/franchise.jpg",
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 329,
                  // childAspectRatio: 1.2,
                  childAspectRatio: 1.1,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return FranchiseCard(offer: offers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FranchiseOffer {
  final String title;
  final String duration;
  final String price;
  final String image;

  FranchiseOffer({
    required this.title,
    required this.duration,
    required this.price,
    required this.image,
  });
}
