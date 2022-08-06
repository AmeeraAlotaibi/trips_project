import 'package:flutter/material.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/providers/profile_provider.dart';
import 'package:frontend/providers/trip_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TripCard extends StatefulWidget {
  final Trip trip;
  TripCard({Key? key, required this.trip}) : super(key: key);

  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  bool isFav = false;
  @override
  void initState() {
    // TODO: implement initState
    Profile profile = context.read<ProfileProvider>().profile;
    isFav = context.read<TripProvider>().isFav(widget.trip, profile);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          context.push('/trip-details',
              extra: widget.trip); // change this later to TRIP DETAILS!!!!!
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
                  image: NetworkImage(widget.trip.image),
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
                      SizedBox(
                        width: 165,
                        child: Text(
                          widget.trip.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF2a3f34),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "by: ${widget.trip.owner!}",
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
                                widget.trip.owner_image == null
                                    ? "https://millingtontownship.com/wp-content/uploads/2021/01/default.jpg"
                                    : widget.trip.owner_image.toString(),
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
            Consumer<TripProvider>(builder: (context, trips, child) {
              return Padding(
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
                      child: !isFav
                          ? const Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            ),
                      onTap: () {
                        // FUNCTION TO ADD TO LIST OF FAVORITE TRIPS
                        setState(() {
                          context.read<ProfileProvider>().addFav(widget.trip,
                              context.read<ProfileProvider>().profile);
                          isFav = !isFav;
                        });
                      },
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
