import 'package:flutter/material.dart';

void main() {
  runApp(const MeetCuteApp());
}

class MeetCuteApp extends StatelessWidget {
  const MeetCuteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetCute App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeetCute App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              key: const Key('loginButton'),
              onPressed: () {
                // Handle login logic here
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16), // Add spacing between buttons
            ElevatedButton(
              key: const Key('socialScreenButton'),
              onPressed: () {
                // Navigate to the SocialScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SocialScreen()),
                );
              },
              child: const Text('Go to Social Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('No notifications yet'),
      ),
    );
  }
}

class SocialScreen extends StatefulWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  _SocialScreenState createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  int unreadNotifications = 0;

  @override
  void initState() {
    super.initState();
    _loadUnreadNotifications();
  }

  Future<int> getUnreadNotificationsCount() async {
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return a mock unread notifications count
    return 3;
  }

  Future<void> _loadUnreadNotifications() async {
    final count = await getUnreadNotificationsCount();
    setState(() {
      unreadNotifications = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Screen'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              key: const Key('notificationButton'),
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigate to NotificationScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()),
                );
              },
            ),
            if (unreadNotifications > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    key: const Key('notificationCounter'),
                    unreadNotifications.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
