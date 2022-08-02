import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/pages/explore.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/profile.dart';
import 'package:go_router/go_router.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  // pages of the bottom tabs ----------------
  final List _pages = [
    HomePage(),
    ExplorePage(),
    ProfilePage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR ------------------------------------
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF2a3f34),
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              // LOGOUT FUNCTION HERE --------------
              context.go("/signin");
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),

      // NAVIGATION ------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
          // styling bottom navigation
          backgroundColor: Color(0xFF5B8A72),
          elevation: 0,
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 245, 244, 239),
          ),
          // bottom navigation bar items
          currentIndex: _selectedIndex,
          onTap: _onTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),

      body: _pages[_selectedIndex],
    );
  }
}
