import 'package:bizbooster/screens/Lead_Details_onboarding/lead_onboard_detail_screen.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/model/restaurant_onboarding_model';
import 'package:bizbooster/services/auth_services.dart';
import 'package:bizbooster/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/components/bottom_bar.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/components/document_eligiblity.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/components/faqs.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/components/how_it_work.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/components/product_video.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/components/t_and_c.dart';

class ProductDetailsTab extends StatefulWidget {
  final String id;
  final String imageurl;

  const ProductDetailsTab(
      {super.key, required this.id, required this.imageurl});

  @override
  State<ProductDetailsTab> createState() => _ProductDetailsTabState();
}

class _ProductDetailsTabState extends State<ProductDetailsTab> {
  late Future<List<ServiceLeadProduct>> _serviceLeadProductsFuture;
  final ScrollController _scrollController = ScrollController();
  final ScrollController _buttonScrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    "Product Benefits": GlobalKey(),
    "Product Video": GlobalKey(),
    "Documents & Eligibility": GlobalKey(),
    "How it works?": GlobalKey(),
    "T & C": GlobalKey(),
    "FAQs": GlobalKey(),
  };

  String _selectedButton = "Product Benefits";

  @override
  void initState() {
    super.initState();
    _serviceLeadProductsFuture = AuthService()
        .fetchServiceLeadProduct(widget.id); // Initialize data fetch
    _scrollController.addListener(_highlightButtonOnScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_highlightButtonOnScroll);
    _scrollController.dispose();
    _buttonScrollController.dispose();
    super.dispose();
  }

  void _highlightButtonOnScroll() {
    for (var entry in _sectionKeys.entries) {
      if (_isVisible(entry.value)) {
        _updateSelectedButton(entry.key);
        break;
      }
    }
  }

  bool _isVisible(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);
      return position.dy < MediaQuery.of(context).size.height / 2 &&
          position.dy > 0;
    }
    return false;
  }

  void _updateSelectedButton(String button) {
    if (_selectedButton != button) {
      setState(() {
        _selectedButton = button;
      });
      _scrollButtonIntoView(button);
    }
  }

  void _scrollButtonIntoView(String button) {
    final buttonIndex = _sectionKeys.keys.toList().indexOf(button);
    if (buttonIndex != -1) {
      _buttonScrollController.animateTo(
        buttonIndex * 150.0, // Approximate button width including padding
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToSection(String section) {
    final context = _sectionKeys[section]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: FutureBuilder<List<ServiceLeadProduct>>(
        future: _serviceLeadProductsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No product data available.'));
          } else {
            final product = snapshot.data!.first; // Use the first product data

            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: RestaurantOnboardingCardd(
                      title: "Restaurant Onboarding",
                      imageUrl: "$servicecardimageurl${widget.imageurl}",
                      // imageUrl:
                      //     "https://5.imimg.com/data5/SELLER/Default/2022/5/RD/MB/IY/14119935/merchant-onboarding-services-500x500.jpeg",
                      isTrending: true,
                    ),
                  ),
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: Colors.white,
                  toolbarHeight: 50,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _recipeTypeButtons(),
                  ),
                ),
                SliverToBoxAdapter(child: _feeCard()),
                SliverToBoxAdapter(child: productBenefit(product)),
                SliverToBoxAdapter(
                    child: ProductVideoWidget(
                  key: _sectionKeys["Product Video"],
                  id: widget.id,
                )),
                SliverToBoxAdapter(
                    child: DocumentEligiblity(
                  key: _sectionKeys["Documents & Eligibility"],
                  id: widget.id,
                )),
                SliverToBoxAdapter(
                    child: HowItWork(
                  key: _sectionKeys["How it works?"],
                  id: widget.id,
                )),
                SliverToBoxAdapter(
                    child: TAndC(
                  key: _sectionKeys["T & C"],
                  id: widget.id,
                )),
                SliverToBoxAdapter(
                    child: Faqs(
                  key: _sectionKeys["FAQs"],
                  id: widget.id,
                )),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _recipeTypeButtons() {
    final buttonTitles = _sectionKeys.keys.toList();
    Color activeColor = Theme.of(context).colorScheme.inversePrimary;
    Color inactiveColor = const Color(0xfff6f9fe);

    return SizedBox(
      height: 40,
      child: ListView.builder(
        controller: _buttonScrollController,
        scrollDirection: Axis.horizontal,
        itemCount: buttonTitles.length,
        itemBuilder: (context, index) {
          final title = buttonTitles[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  _selectedButton == title ? activeColor : inactiveColor,
                ),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () => _scrollToSection(title),
              child: Text(title),
            ),
          );
        },
      ),
    );
  }

  Widget productBenefit(ServiceLeadProduct product) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        key: _sectionKeys["Product Benefits"],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Product Benefits",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.imagedescription}",
                      style: const TextStyle(
                        height: 2.0, // Increase line spacing (height factor)
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Image.network(
                    "$leaddetailproductdetalis${product.imagefilename}",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _feeCard() {
    return Card(
      color: Colors.white,
      elevation: 2, // Add shadow to the card
      margin:
          EdgeInsets.only(top: 8, left: 8, right: 8), // Margin around the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Lifelinecart Restaurant Onboarding",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),

            // Pricing and discount
            Row(
              children: const [
                Text(
                  "Onboarding fee : ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "5999/-",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "9999/-",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "45% Off",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Rating
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black, // Background color for the rating bar
                borderRadius: BorderRadius.circular(24), // Rounded edges
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Circular badge for the rating score
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.amber, // Circle background color
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "5.0",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),

                  // Stars
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Restaurant type",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            // Buttons for Restaurant Type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Primium", // Deliberate typo in the design
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Regular",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
