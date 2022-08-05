import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/providers/profile_provider.dart';
import 'package:frontend/providers/trip_provider.dart';
import 'package:frontend/widgets/latest_trip_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY ----------------------------------------------
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<ProfileProvider>(builder: (context, home, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back,".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 145, 161, 147),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.25,
                        ),
                      ),
                      Text(
                        home.profile.user!.username.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color(0xFF5B8A72),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ],
                  ),
                  // USER AVATAR --------------------------
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF5B8A72),
                    backgroundImage: NetworkImage(
                      home.profile.image.toString(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Latest Trips:",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF2a3f34),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.25,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              // List VIEW
              Container(
                height: 175,
                child: FutureBuilder(
                    future: context.read<TripProvider>().getAllTrips(),
                    builder: (context, dataSnapshot) {
                      if (dataSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Consumer<TripProvider>(
                            builder: (context, trips, child) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, _) => SizedBox(
                              width: 12,
                            ),
                            itemCount: (trips.trips
                                .skip(trips.trips.length - 5)
                                .take(4)
                                .length),
                            itemBuilder: (context, index) => LatestTripCard(
                              trips: trips.trips[index],
                            ),
                          );
                        });
                      }
                    }),
              )
            ],
          );
        }),
      ),
    );
  }
}
