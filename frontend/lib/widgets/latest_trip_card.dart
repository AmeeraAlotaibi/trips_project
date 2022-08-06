import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/providers/trip_provider.dart';
import 'package:provider/provider.dart';

class LatestTripCard extends StatelessWidget {
  LatestTripCard({
    Key? key,
    required this.trips,
  }) : super(key: key);
  final Trip trips;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 175,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(trips.image),
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              left: 10,
              child: SizedBox(
                width: 125,
                child: Text(
                  trips.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16.5,
                    color: Color(0xFF2a3f34),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 9,
              left: 10,
              child: Text(
                trips.owner!,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF5B8A72),
                ),
              ),
            ),
          ],
        ));
  }
}
