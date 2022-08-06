import 'package:flutter/material.dart';
import 'package:frontend/widgets/trip_widget.dart';
import 'package:provider/provider.dart';

import '../providers/trip_provider.dart';

class WantToPage extends StatelessWidget {
  final List<int> wants;
  const WantToPage({Key? key, required this.wants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // List<Trip> trips = context.read<TripProvider>().getMyWantTO(trips);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color(0xFF2a3f34),
            size: 30,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Consumer<TripProvider>(builder: (context, trips, child) {
          return trips.getMyWantTO(wants).isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.not_interested_sharp,
                        size: 50,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You have no favorites yet!",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                )
              : SafeArea(
                  child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: trips.getMyWantTO(wants).length,
                    itemBuilder: (context, index) =>
                        TripCard(trip: trips.getMyWantTO(wants)[index]),
                  ),
                ));
        }));
  }
}
