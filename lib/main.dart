// import 'package:bizbooster/pages/dashboard.dart';
// import 'package:bizbooster/pages/demo.dart';
// import 'package:bizbooster/pages/login_screen.dart';
// import 'package:bizbooster/pages/registration.dart';
// import 'package:bizbooster/pages/webinar_screen.dart';
import 'package:bizbooster/pages/bottom_nav_bar.dart';
import 'package:bizbooster/pages/dashboard.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/lead_onboard_detail_screen.dart';
import 'package:bizbooster/screens/Login/login_screen.dart';
import 'package:bizbooster/screens/category_onboarding/category_screen.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: isLoggedIn ? BottomNavBar() : const LoginScreen(),
      // home: isLoggedIn ? const OnboardingScreen() : const LoginScreen(),
      // home: WebinarScreen(),
      // home: const loginScreen(),
      // home: const Register(),
      // home: BottomNavBar(),
      // home: MyDashboard(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       counter++;
//       buildd();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: '',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Widget buildd() {
//     return Scaffold(
//       body: AlertDialog(
//         title: Text(counter.toString()),
//       ),
//     );
//   }
// }
