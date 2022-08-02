import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 125,
              height: 125,
              child: CircleAvatar(
                backgroundColor: Color(0xFF2a3f34),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Full name and gender ------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Ameera Alotaibi",
                  style: TextStyle(
                    fontSize: 18.5,
                    color: Color(0xFF5F7161),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  color: Color.fromARGB(255, 202, 202, 202),
                  width: 1,
                  height: 22,
                ),
                SizedBox(
                  width: 7.5,
                ),
                Icon(
                  Icons.female,
                  color: Colors.pink[200],
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),
            // @username -----------------------------------------
            Text(
              "@Meerareed",
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF2a3f34),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // dates -------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Birth date =========================================================
                Column(
                  children: [
                    Text(
                      "Birthday:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF5F7161),
                      ),
                    ),
                    Text(
                      "07-12-1999",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2a3f34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  height: 35,
                  color: Color.fromARGB(255, 202, 202, 202),
                ),
                // Date Joined ========================================================
                Column(
                  children: [
                    Text(
                      "Joined in:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF5F7161),
                      ),
                    ),
                    Text(
                      "10-08-2022",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2a3f34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // ABOUT ====================================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "About:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF5F7161),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF2a3f34),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              width: 300,
              height: 1,
              color: Color.fromARGB(255, 202, 202, 202),
            ),

            const SizedBox(
              height: 20,
            ),

            // Trips Lists ===========================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trips Lists:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF2a3f34),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
