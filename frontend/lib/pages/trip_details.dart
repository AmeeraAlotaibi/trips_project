import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/providers/profile_provider.dart';
import 'package:frontend/providers/trip_provider.dart';
import 'package:frontend/widgets/ask_question_dialog.dart';
import 'package:frontend/widgets/custom_widgets.dart';
import 'package:frontend/widgets/questions_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/client.dart';

class TripDetailsPage extends StatefulWidget {
  final Trip trip;

  const TripDetailsPage({
    Key? key,
    required this.trip,
  }) : super(key: key);
  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  final question = TextEditingController();
  bool isFav = false;
  bool isPressed = false;
  void initState() {
    // TODO: implement initState
    Profile profile = context.read<ProfileProvider>().profile;
    isFav = context.read<TripProvider>().isFav(widget.trip, profile);
    isPressed = context.read<TripProvider>().isWantTo(widget.trip, profile);
  }

  @override
  Widget build(BuildContext context) {
    String? user = context.watch<ProfileProvider>().profile.username;
    return Scaffold(
      floatingActionButton: widget.trip.owner == user
          ? FloatingActionButton(
              onPressed: () {
                context.push("/edit-trip", extra: widget.trip);
              },
              backgroundColor: const Color(0xFF5B8A72),
              child: const Icon(
                Icons.edit,
                size: 25,
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AskQuestion(
                        trip: widget.trip,
                      );
                    });
              },
              backgroundColor: const Color(0xFF5B8A72),
              child: const Text("Ask"),
            ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.trip.owner == user
                ? GestureDetector(
                    onTap: () {
                      context
                          .read<TripProvider>()
                          .deleteTrip(trip: widget.trip);
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(SnackBar(
                        content:
                            Text("Successfully deleted ${widget.trip.title}!"),
                        backgroundColor:
                            const Color.fromARGB(255, 145, 161, 147),
                        action: SnackBarAction(
                            label: 'Hide',
                            textColor: Colors.black,
                            onPressed: scaffold.hideCurrentSnackBar),
                      ));
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.red,
                        size: 25.5,
                      ),
                    ),
                  )
                : null,
          )
        ],
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
                          GestureDetector(
                            onTap: () {
                              context.push("/user-profile",
                                  extra: widget.trip.profile);
                            },
                            child: Text(
                              widget.trip.owner!,
                              style: TextStyle(
                                color: Color(0xFF5B8A72),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 125,
                        child: ElevatedButton(
                          onPressed: () {
                            // ADD TRIP TO WANT TO GO LIST
                            setState(() {
                              isPressed = !isPressed;
                              context
                                  .read<ProfileProvider>()
                                  .wantTO(widget.trip);
                            });
                            if (isPressed == true) {
                              final scaffold = ScaffoldMessenger.of(context);
                              scaffold.showSnackBar(SnackBar(
                                content: Text(
                                    "Successfully added ${widget.trip.title} to list!"),
                                backgroundColor:
                                    Color.fromARGB(255, 145, 161, 147),
                                action: SnackBarAction(
                                    label: 'Hide',
                                    textColor: Colors.black,
                                    onPressed: scaffold.hideCurrentSnackBar),
                              ));
                            } else {
                              final scaffold = ScaffoldMessenger.of(context);
                              scaffold.showSnackBar(SnackBar(
                                content: Text(
                                    "Successfully removed ${widget.trip.title} from list!"),
                                backgroundColor:
                                    const Color.fromARGB(255, 145, 161, 147),
                                action: SnackBarAction(
                                    label: 'Hide',
                                    textColor: Colors.black,
                                    onPressed: scaffold.hideCurrentSnackBar),
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: isPressed == true
                                ? Colors.white
                                : const Color(0xFF5B8A72),
                          ),
                          child: Text(
                            isPressed == false ? "Want To Go" : "Remove",
                            style: TextStyle(
                              color: isPressed == false
                                  ? Colors.white
                                  : const Color(0xFF5B8A72),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
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
                        style: const TextStyle(
                          color: Color(0xFF2a3f34),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Q&A Section",
                        style: TextStyle(
                          color: Color(0xFF2a3f34),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey[300],
                      ),

                      // QUESTION CARD!!!!
                      Container(
                        // width: 390,
                        height: 300,
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            itemCount: widget.trip.questions!.length,
                            itemBuilder: (context, index) => QuestionCard(
                              questionId: widget.trip.questions![index].id!,
                              trip_owner: widget.trip.owner!,
                              asker_image: widget.trip.questions![index].image!,
                              owner_image: widget.trip.owner_image!,
                              question: widget.trip.questions![index].text!,
                              answer: widget.trip.questions![index].replies!
                                      .isNotEmpty
                                  ? widget
                                      .trip.questions![index].replies![0].text!
                                  : "",
                            ),
                          ),
                        ),
                      ),
                      // widget.trip.owner != user
                      //     ? Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           CustomInputField(
                      //             width: 300,
                      //             controller: question,
                      //             hintText: "Ask a Question",
                      //             hiddenText: false,
                      //           ),
                      //           CustomButton(
                      //             width: 60,
                      //             onPressed: () async {
                      //               await context.read<TripProvider>().askQ(
                      //                   Question(
                      //                       text: question.text,
                      //                       image: context
                      //                           .read<ProfileProvider>()
                      //                           .profile
                      //                           .image,
                      //                       replies: [],
                      //                       id: widget.trip.questions!.length +
                      //                           1),
                      //                   widget.trip.id!);
                      //               // setState(() {
                      //               //   the_answer = _answer.text;
                      //               // });
                      //             },
                      //             buttonText: "Ask",
                      //           ),
                      //         ],
                      //       )
                      //     : const SizedBox(
                      //         height: 0,
                      //       ),
                    ],
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
