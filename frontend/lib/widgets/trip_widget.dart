import 'package:flutter/material.dart';
import 'package:frontend/models/trip.dart';
import 'package:go_router/go_router.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  const TripCard({Key? key, required this.trip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          context.push('/trip-details',
              extra: trip); // change this later to TRIP DETAILS!!!!!
        },
        child: Stack(
          children: [
            Container(
              width: 400,
              height: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(trip.image),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 350,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        trip.title,
                        style: const TextStyle(
                          color: Color(0xFF2a3f34),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "by:  ${trip.owner!}",
                            style: const TextStyle(
                              color: Color(0xFF2a3f34),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                trip.owner_image == null
                                    ? "https://millingtontownship.com/wp-content/uploads/2021/01/default.jpg"
                                    : trip.owner_image.toString(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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
                      color: Colors.grey,
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
      ),
    );
  }
}
