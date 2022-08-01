import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/pages/home.dart';
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
    Icon(Icons.explore),
    Icon(Icons.person),
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
          color: Color(0xFF5B8A72),
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 244, 239),
      ),

      // NAVIGATION ------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
          // styling bottom navigation
          backgroundColor: Color(0xFF5B8A72),
          elevation: 0,
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            color: Color.fromARGB(255, 245, 244, 239),
          ),
          // bottom navigation bar logic
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

      // DRAWER --------------------------------------------------
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 245, 244, 239),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: [
                DrawerHeader(
                    child: Row(
                  children: [
                    // add image here later per user
                    CircleAvatar(
                      backgroundColor: Color(0xFF2a3f34),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        // add name of username here
                        Text(
                          "first name",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                )),

                SizedBox(
                  height: 50,
                ),

                // logout
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 30,
                    color: Color(0xFF2a3f34),
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Color(0xFF2a3f34),
                    ),
                  ),
                  onTap: () {
                    context.go("/signin");
                  },
                ),
              ],
            ),
          )),

      body: _pages[_selectedIndex],
    );
  }
}
