import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';

class TripDetailsPage extends StatefulWidget {
  final Trip trip;

  TripDetailsPage({
    Key? key,
    required this.trip,
  }) : super(key: key);

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 325,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.trip.image,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 275,
                        child: Text(
                          widget.trip.title,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0xFF2a3f34),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color.fromARGB(238, 214, 214, 214),
                            )),
                        child: GestureDetector(
                          child: isFav == false
                              ? Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                  size: 20,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                          onTap: () {
                            // FUNCTION TO ADD TO LIST OF FAVORITE TRIPS
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // TRIP OWNER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                widget.trip.owner_image == null
                                    ? "https://millingtontownship.com/wp-content/uploads/2021/01/default.jpg"
                                    : widget.trip.owner_image.toString(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.trip.owner!,
                            style: TextStyle(
                              color: Color(0xFF5B8A72),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // ADD TRIP TO WANT TO GO LIST
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text("Success!"),
                              content: Text(
                                  "Successfully added ${widget.trip.title} to list!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text("OK"),
                                )
                              ],
                            ),
                            barrierDismissible: false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                        ),
                        child: const Text(
                          "Want To Go",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Description:",
                    style: TextStyle(
                      color: Color(0xFF2a3f34),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.trip.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xFF2a3f34),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
