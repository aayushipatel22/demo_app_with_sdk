import 'package:demo_sdk/demo_sdk.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {

  final String username;

  const HomePage({
    super.key,
    required this.username,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    // List of Pages
    final List<Widget> pages = [

      // Home Tab
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.home,
              size: 80,
              color: Colors.blue,
            ),

            const SizedBox(height: 15),

            Text(
              'Welcome ${widget.username}!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'This is your Home Page.',
              style: TextStyle(fontSize: 16),
            ),

          ],
        ),
      ),

      // Profile Tab
      ProfilePage(username: widget.username),

      // Settings Tab
      const SettingsPage(),

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Application'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [

          // Logout Button
          IconButton(
            icon: const Icon(Icons.logout),
            // onPressed: () {
            //   Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const LoginPage(),
            //     ),
            //         (route) => false,
            //   );
            // },
            onPressed: () {
              // Clear SDK Session
              LoginSdk.logout();

              // Navigate to Login Page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                    (route) => false,
              );
            },
          ),

        ],
      ),

      // Display Selected Page

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      // Bottom Navigation Bar

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),

          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),

        ],
      ),
    );
  }
}