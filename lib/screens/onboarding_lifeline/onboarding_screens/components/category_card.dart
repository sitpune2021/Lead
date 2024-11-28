import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/components/model/category_card_item.dart';
import 'package:flutter/material.dart';

class HorizontalCardList extends StatefulWidget {
  const HorizontalCardList({super.key});

  @override
  _HorizontalCardListState createState() => _HorizontalCardListState();
}

class _HorizontalCardListState extends State<HorizontalCardList> {
  List<CardItem> _cardItems = [
    CardItem(
      title: "Merchant Acquisition",
      subtitle: "Earn Upto ₹ 1000",
      reward: 1000,
    ),
    CardItem(
      title: "Seller Acquisition",
      subtitle: "Earn Upto ₹ 1000",
      reward: 1000,
    ),
    CardItem(
      title: "Employee Acquisition",
      subtitle: "Earn Upto ₹ 1000",
      reward: 1000,
    ),
  ];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://example.com/api/cards'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _cardItems = data.map((item) => CardItem.fromJson(item)).toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cardItems.length,
        itemBuilder: (context, index) {
          final cardItem = _cardItems[index];
          final Color color;
          if (index % 2 == 0) {
            color = const Color(0xFFF5EBFF);
          } else {
            color = const Color(0xfffedf0ff);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CategoryCard(
              title: cardItem.title,
              subtitle: cardItem.subtitle,
              reward: cardItem.reward,
              color: color,
            ),
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int reward;
  final Color? color;

  const CategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.reward,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // color: const Color(0xFFF5EBFF),
          color: color ?? const Color(0xFFF5EBFF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.storefront,
                    color: Colors.purple,
                    size: 36,
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 8),
            // Text(
            //   subtitle,
            //   style: const TextStyle(
            //     fontSize: 16,
            //     color: Colors.black,
            //   ),
            // ),
            const SizedBox(height: 8),
            Text(
              "Earn Upto ₹ $reward",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
