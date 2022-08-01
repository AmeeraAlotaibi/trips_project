import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR ------------------------------------------------
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF5B8A72),
          size: 30,
          ),
        elevation: 0,
        backgroundColor:Color.fromARGB(255, 245, 244, 239),
      ),

      // DRAWER --------------------------------------------------
      drawer: Drawer(
        backgroundColor:Color.fromARGB(255, 245, 244, 239),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    // add image here later per user
                    CircleAvatar(radius: 40,),
                    SizedBox(width: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello,", 
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        ),
                        // add name of username here
                        Text("first name", 
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        ),
                        
                      ],
                    )
                  ],
                  )
                ),
        
              // profile icon list tile
              // ListTile(
              //   leading: Icon(
              //     Icons.person, 
              //     size: 30, 
              //     color: Color(0xFF5B8A72),
              //     ),
              //   title: const Text("Profile", 
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 0.5,
              //     color: Color(0xFF5B8A72),
              //   ),
              //   ),
              //   onTap: () {
              //     // push to profile page
              //   },
              // ),
        
              // explore icon list tile
              // ListTile(
              //   leading: Icon(
              //     Icons.explore, 
              //     size: 30, 
              //     color: Color(0xFF5B8A72),
              //     ),
              //   title: const Text("Explore", 
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 0.5,
              //     color: Color(0xFF5B8A72),
              //   ),
              //   ),
              //   onTap: () {
              //     // push to profile page
              //   },
              // ),
        
              SizedBox(height: 50,),
              
              // logout
              ListTile(
                leading: Icon(
                  Icons.logout, 
                  size: 30, 
                  color: Color(0xFF5B8A72),
                  ),
                title: const Text("Logout", 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: Color(0xFF5B8A72),
                ),
                ),
                onTap: () {
                  // pop to main page (sign in page)
                },
              ),
              
        
            ],
          ),
        )
      ),


      // BODY ----------------------------------------------
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back,".toUpperCase(), 
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30, 
                color: Color(0xFF5B8A72),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.25,
                ),
              ),
              
              // will change this later to display the first name of the user
              Text("user".toUpperCase(), 
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30, 
                color: Color(0xFF5B8A72),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
