import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harry_likes_sally_example/firebase_options.dart';
import 'package:harry_likes_sally_example/screens/main_screen.dart';
import 'package:harry_likes_sally_example/screens/social_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.ios,
  ); // Initialize Firebase
  runApp(MeetCuteApp());
}

class MeetCuteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetCute',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MeetCuteHome(),
    );
  }
}

class MeetCuteHome extends StatefulWidget {
  @override
  State<MeetCuteHome> createState() => _MeetCuteHomeState();
}

class _MeetCuteHomeState extends State<MeetCuteHome> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MainScreen(),
    SocialScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Social',
          ),
        ],
      ),
    );
  }
}
