import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/widgets/custom_widgets.dart';

class TripDetailsPage extends StatelessWidget {
  TripDetailsPage({Key? key}) : super(key: key);

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
                        image: AssetImage(
                          "assets/images/trip.jpg",
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
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trip Title",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color(0xFF2a3f34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // ADD TRIP TO WANT TO GO LIST
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
                                  color: Colors.grey,
                                )),
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
                          )
                        ],
                      ),
                    ],
                  ),
                  // TRIP OWNER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Trip Owner",
                        style: TextStyle(
                          color: Color(0xFF5B8A72),
                          fontSize: 20,
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
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
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
