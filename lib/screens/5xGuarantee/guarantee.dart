import 'package:bizbooster/screens/5xGuarantee/components/guarantee_card_list.dart';
import 'package:bizbooster/screens/5xGuarantee/components/guarantee_header.dart';
import 'package:bizbooster/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class Guarantee extends StatelessWidget {
  const Guarantee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('5X Guarantee'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const GuaranteeHeader(),
              const BannerWidget(
                image: "assets/images/1xb.jpeg",
              ),
              _buildCheckboxGrid(),
              const GuaranteeCardList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxGrid() {
    List<bool> checkedStatus = [
      true,
      true,
      true,
      true,
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 36,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 18,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          bool isChecked = checkedStatus[index];
          return _buildCheckboxWithLabel(index + 1, isChecked);
        },
      ),
    );
  }

  Color interpolateColor(int number) {
    Color startColor = const Color.fromARGB(255, 179, 161, 0);
    Color endColor = const Color.fromARGB(255, 192, 17, 5);

    double ratio = (number - 1) / (36 - 1);

    ratio = ratio.clamp(0.0, 1.0);

    int r = (startColor.red + (endColor.red - startColor.red) * ratio).round();
    int g = (startColor.green + (endColor.green - startColor.green) * ratio)
        .round();
    int b =
        (startColor.blue + (endColor.blue - startColor.blue) * ratio).round();

    return Color.fromARGB(255, r, g, b);
  }

  Widget _buildCheckboxWithLabel(int number, bool isChecked) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Transform.scale(
            scale: 1.15,
            child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {},
              activeColor: Colors.green,
              checkColor: Colors.white,
            ),
          ),
        ),
        if (!isChecked)
          Positioned(
            child: Text(
              number < 10 ? '0$number' : '$number',
              style: TextStyle(
                fontSize: 11,
                color: interpolateColor(number),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
