import 'package:flutter/material.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/widgets/trip_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UserListsPage extends StatelessWidget {
  final List<Trip> trips;
  const UserListsPage({Key? key, required this.trips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF2a3f34),
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              // LOGOUT FUNCTION HERE --------------
              context.read<AuthProvider>().logout();
              context.go("/signin");
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Trips Lists:",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF2a3f34),
                fontWeight: FontWeight.bold,
              ),
            ),
            // line
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 1,
              color: Color.fromARGB(255, 202, 202, 202),
            ),

            // list item------------
            InkWell(
              onTap: () {
                // -------------------------------------
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
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
                    children: const [
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
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: trips.length,
                  itemBuilder: (context, index) =>
                      TripCard(trip: trips[index])),
            )
          ],
        ),
      ),
    );
  }
}
