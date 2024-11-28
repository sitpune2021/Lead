import 'package:bizbooster/screens/Lead_Details_onboarding/components/bottom_bar.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/freanchise_components/ffaqs.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/freanchise_components/fhow_it_work.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/freanchise_components/fproduct_video.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/freanchise_components/ft_and_c.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/freanchise_components/payout.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/lead_onboard_detail_screen.dart';
import 'package:bizbooster/utils/constant.dart';
import 'package:flutter/material.dart';

class FranchiseDetailsTab extends StatefulWidget {
  final String imageurl;
  const FranchiseDetailsTab({super.key, required this.imageurl});

  @override
  State<FranchiseDetailsTab> createState() => _FranchiseDetailsTabState();
}

class _FranchiseDetailsTabState extends State<FranchiseDetailsTab> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _buttonScrollController =
      ScrollController(); // New controller for buttons
  final Map<String, GlobalKey> _sectionKeys = {
    "Payout": GlobalKey(),
    "How it works?": GlobalKey(),
    "Training Video": GlobalKey(),
    "T & C": GlobalKey(),
    "FAQs": GlobalKey(),
  };

  String _selectedButton = "Payout";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_highlightButtonOnScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_highlightButtonOnScroll);
    _scrollController.dispose();
    _buttonScrollController
        .dispose(); // Dispose of the button scroll controller
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
      _scrollButtonIntoView(button); // Scroll the button into view
    }
  }

  void _scrollButtonIntoView(String button) {
    final buttonIndex = _sectionKeys.keys.toList().indexOf(button);
    if (buttonIndex != -1) {
      // Calculate the scroll offset for the button
      _buttonScrollController.animateTo(
        buttonIndex * 100.0, // Adjust 100.0 based on button width
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
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            child: RestaurantOnboardingCardd(
              title: "Restaurant Onboarding",
              // imageUrl:
              //     "https://5.imimg.com/data5/SELLER/Default/2022/5/RD/MB/IY/14119935/merchant-onboarding-services-500x500.jpeg",
              imageUrl: "$servicecardimageurl${widget.imageurl}",
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
            child: _sectionButtons(),
          ),
        ),
        SliverToBoxAdapter(child: Payout(key: _sectionKeys["Payout"])),
        SliverToBoxAdapter(
            child: FhowItWork(key: _sectionKeys["How it works?"])),
        SliverToBoxAdapter(
            child: FproductVideo(key: _sectionKeys["Training Video"])),
        SliverToBoxAdapter(child: FtAndC(key: _sectionKeys["T & C"])),
        SliverToBoxAdapter(child: Ffaqs(key: _sectionKeys["FAQs"])),
      ],
    );
  }

  Widget _sectionButtons() {
    final buttonTitles = _sectionKeys.keys.toList();
    Color activeColor = Theme.of(context).colorScheme.inversePrimary;
    Color inactiveColor = const Color(0xfff6f9fe);

    return SizedBox(
      height: 40,
      child: ListView.builder(
        controller:
            _buttonScrollController, // Set controller for scrolling buttons
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
}
