import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/providers/trip_provider.dart';
import 'package:frontend/widgets/trip_widget.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: FutureBuilder(
          future: context.read<TripProvider>().getAllTrips(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              print("HERE Waiting");
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer<TripProvider>(builder: (context, trips, child) {
                print(trips.trips);
                return ListView.builder(
                    itemCount: trips.trips.length,
                    itemBuilder: (context, index) =>
                        TripCard(trip: trips.trips[index]));
              });
            }
          }),
    )));
  }
}
