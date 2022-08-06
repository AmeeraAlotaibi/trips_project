import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/widgets/trip_widget.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key, this.trips}) : super(key: key);
  final List<Trip>? trips;
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
        ),
        body: trips == null
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
            : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: trips!.length,
                  itemBuilder: (context, index) =>
                      TripCard(trip: trips![index]),
                ),
              ));
  }
}
