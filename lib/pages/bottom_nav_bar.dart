// import 'package:bizbooster/pages/academy_screen.dart';
// import 'package:bizbooster/pages/dashboard.dart';
// import 'package:bizbooster/screens/profile_section/Help_and_Support.dart/support_screen.dart';
// import 'package:flutter/material.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _currentIndex = 0;
//   final List<Widget> _screens = [
//     DashboardPage(title: "Bizbooster"),
//     Page3(),
//     AcademyScreen(),
//     SupportScreen()
//   ];
//   void _onDestinationSelected(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: _screens[_currentIndex],
//         ),
//         bottomNavigationBar: NavigationBar(
//             backgroundColor: Colors.white,
//             height: 70,
//             selectedIndex: _currentIndex,
//             onDestinationSelected: _onDestinationSelected,
//             destinations: [
//               NavigationDestination(
//                   selectedIcon: Icon(Icons.home,
//                       color: Theme.of(context).colorScheme.inversePrimary),
//                   icon: Icon(
//                     Icons.home,
//                   ),
//                   label: "Home"),
//               NavigationDestination(
//                   selectedIcon: Icon(Icons.laptop_mac_rounded,
//                       color: Theme.of(context).colorScheme.inversePrimary),
//                   icon: Icon(Icons.laptop_mac_rounded),
//                   label: "Marketing"),
//               NavigationDestination(
//                   selectedIcon: Icon(Icons.book,
//                       color: Theme.of(context).colorScheme.inversePrimary),
//                   icon: Icon(Icons.book),
//                   label: "Academy"),
//               NavigationDestination(
//                   selectedIcon: Icon(Icons.support_agent,
//                       color: Theme.of(context).colorScheme.inversePrimary),
//                   icon: Icon(Icons.support_agent),
//                   label: "Support")
//             ]));
//   }
// }

import 'package:bizbooster/pages/academy_screen.dart';
import 'package:bizbooster/pages/dashboard.dart';
import 'package:bizbooster/screens/profile_section/Help_and_Support.dart/support_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardPage(title: "Bizbooster"),
    Page3(),
    AcademyScreen(),
    SupportScreen(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onDestinationSelected,
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 25),
        height: 65, // Adjust height
        width: 65, // Adjust width
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              // Action for FAB
            },
            shape: CircleBorder(),
            child: ClipOval(child: Image.asset("assets/images/offer.jpg"))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Custom Bottom Navigation Bar Widget
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 18.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Items
            Row(
              children: [
                _buildNavItem(
                  icon: Icons.home,
                  label: "Home",
                  index: 0,
                ),
                SizedBox(width: 20),
                _buildNavItem(
                  icon: Icons.laptop,
                  label: "Marketing",
                  index: 1,
                ),
              ],
            ),
            // Right Items
            Row(
              children: [
                _buildNavItem(
                  icon: Icons.book,
                  label: "Academy",
                  index: 2,
                ),
                SizedBox(width: 20),
                _buildNavItem(
                  icon: Icons.support_agent,
                  label: "Support",
                  index: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
