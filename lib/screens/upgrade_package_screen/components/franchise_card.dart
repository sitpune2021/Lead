import 'package:bizbooster/screens/upgrade_package_screen/upgrade_package_screen.dart';
import 'package:flutter/material.dart';

class FranchiseCard extends StatelessWidget {
  final FranchiseOffer offer;

  const FranchiseCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              // borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              // child: Image.network(
              //   "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png",
              //   width: double.infinity,
              //   height: 150,
              //   fit: BoxFit.cover,
              // ),
              child: Image.asset(
                offer.image,
                fit: BoxFit.cover,
                height: 250, // Adjust the height according to your needs
                width: double.infinity,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 5.0, top: 5.0),
                  child: Text(
                    textAlign: TextAlign.start,
                    offer.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      // backgroundColor: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Duration:",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  offer.duration,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              offer.price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your onPressed functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size.infinite,
                    backgroundColor: Colors.orange, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Upgrade Package',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
