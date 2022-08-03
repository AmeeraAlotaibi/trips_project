import 'package:flutter/material.dart';
import 'package:frontend/models/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  const TripCard({Key? key, required this.trip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(trip.image!),
              ),
            ),
          ),
          Container(
            width: 400,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    trip.profile!.user!.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Favorite button
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  child: const Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.red,
                  ),
                  onTap: () {
                    // FUNCTION TO ADD TO LIST OF FAVORITE TRIPS
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
