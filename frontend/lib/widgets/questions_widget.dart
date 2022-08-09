// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frontend/models/reply.dart';
import 'package:frontend/providers/trip_provider.dart';
import 'package:provider/provider.dart';

import '../providers/profile_provider.dart';
import 'custom_widgets.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    required this.asker_image,
    required this.owner_image,
    required this.question,
    required this.answer,
    required this.questionId,
    required this.trip_owner,
    Key? key,
  }) : super(key: key);
  final int questionId;
  final String trip_owner;
  final String asker_image;
  final String question;
  final String answer;
  final String owner_image;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  final _answer = TextEditingController();
  late String the_answer = "";
  void initState() {
    super.initState();
    // add post frame callback to update the image
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    the_answer = widget.answer;
    // });
  }

  @override
  Widget build(BuildContext context) {
    String? user = context.watch<ProfileProvider>().profile.username;
    return Column(
      children: [
        // QUESTION ROW
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[500],
              backgroundImage: NetworkImage(widget.asker_image),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Q:",
                      style: TextStyle(
                        color: Color(0xFF5B8A72),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 225,
                      child: Text(
                        widget.question,
                        maxLines: 3,
                        style: TextStyle(
                          color: Color(0xFF2a3f34),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

        SizedBox(
          height: 5.5,
        ),
        // ANSWER ROW
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey[500],
              backgroundImage: NetworkImage(widget.owner_image),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
                color: Colors.white,
                child: widget.trip_owner == user
                    ? the_answer != ""
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "A:",
                                style: TextStyle(
                                  color: Color(0xFF5B8A72),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 240,
                                child: Text(
                                  the_answer,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    color: Color(0xFF2a3f34),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInputField(
                                width: 240,
                                controller: _answer,
                                hintText: "Reply",
                                // icon: const Icon(Icons.password),
                                hiddenText: false,
                              ),
                              CustomButton(
                                width: 60,
                                onPressed: () async {
                                  await context.read<TripProvider>().reply(
                                      Reply(text: _answer.text),
                                      widget.questionId);
                                  setState(() {
                                    the_answer = _answer.text;
                                  });
                                  // print(_answer.text);
                                },
                                buttonText: "Reply",
                              ),
                            ],
                          )
                    : SizedBox(
                        height: 25,
                      ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
