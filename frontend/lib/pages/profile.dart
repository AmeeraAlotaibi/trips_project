import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/providers/profile_provider.dart';
import 'package:frontend/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: FutureBuilder(
              future: context.read<ProfileProvider>().getProfileData(),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  print("HERE Waiting");
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Consumer<ProfileProvider>(
                      builder: (context, profile, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(children: [
                          Container(
                            width: 125,
                            height: 125,
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF2a3f34),
                              backgroundImage: NetworkImage(
                                profile.profile.image == null
                                    ? "https://millingtontownship.com/wp-content/uploads/2021/01/default.jpg"
                                    : profile.profile.image.toString(),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                context.push("/edit-profile");
                              },
                              child: ClipOval(
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  color: Color(0xFF5B8A72),
                                  child: Icon(
                                    Icons.edit,
                                    size: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),

                        const SizedBox(
                          height: 20,
                        ),
                        // Full name and gender ------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${profile.profile.user?.first_name} ${profile.profile.user?.last_name}",
                              style: TextStyle(
                                fontSize: 18.5,
                                color: Color(0xFF5F7161),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            // GENDER

                            profile.profile.gender == ""
                                ? Text("")
                                : profile.profile.gender == "female"
                                    ? Icon(
                                        Icons.female,
                                        color: Colors.pink[200],
                                      )
                                    : Icon(
                                        Icons.male,
                                        color: Colors.blue[200],
                                      ),
                          ],
                        ),

                        const SizedBox(
                          height: 5,
                        ),
                        // @username -----------------------------------------
                        Text(
                          "@${profile.profile.user?.username}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF2a3f34),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(
                          width: 15,
                        ),
                        const SizedBox(
                          height: 20,
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
                                  profile.profile.birth_date.toString(),
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
                              height: 50,
                              color: Color.fromARGB(255, 202, 202, 202),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Total trips:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF5F7161),
                                  ),
                                ),
                                Text(
                                  profile.profile.trips?.length == null
                                      ? "0"
                                      : "${profile.profile.trips?.length}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF2a3f34),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 50,
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
                                  profile.profile.date_joined.toString(),
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
                                profile.profile.bio.toString(),
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
                          height: 25,
                        ),

                        Container(
                          width: 300,
                          height: 1,
                          color: Color.fromARGB(255, 228, 228, 228),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Trips Lists ===========================================================
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              TextButton(
                                onPressed: () {
                                  context.push("/user-lists");
                                },
                                child: Text(
                                  "See all",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF5F7161),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // TRIPS LISTS CARDS ------------------------------------------
                        InkWell(
                          onTap: () {
                            // -------------------------------------
                          },
                          child: Container(
                            width: 305,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide.none,
                                    left: BorderSide.none,
                                    right: BorderSide.none,
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 228, 228, 228),
                                    ))),
                            child: Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.list,
                                    color: Color(0xFF5F7161),
                                    size: 27,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Want to go",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF5F7161),
                                      fontSize: 18.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            // ---------------------
                          },
                          child: Container(
                            width: 305,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide.none,
                                    left: BorderSide.none,
                                    right: BorderSide.none,
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 228, 228, 228),
                                    ))),
                            child: Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.list,
                                    color: Color(0xFF5F7161),
                                    size: 27,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Favorites",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF5F7161),
                                      fontSize: 18.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
                }
              })),
    );
  }
}
