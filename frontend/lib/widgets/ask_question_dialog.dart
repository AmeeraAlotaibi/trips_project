import 'package:flutter/material.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/providers/trip_provider.dart';
import 'package:provider/provider.dart';

import '../models/question.dart';
import '../providers/profile_provider.dart';

class AskQuestion extends StatelessWidget {
  final Trip trip;
  const AskQuestion({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var question = TextEditingController();
    return AlertDialog(
      content: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Form(
              // key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Ask Question",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        minLines: 1,
                        controller: question,
                        decoration: const InputDecoration(
                            hintText: "Write your question")),
                  ),
                  Consumer<TripProvider>(builder: (context, auth, child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          child: Text("ASk Question"),
                          onPressed: () async {
                            await context.read<TripProvider>().askQ(
                                Question(
                                    text: question.text,
                                    image: context
                                        .read<ProfileProvider>()
                                        .profile
                                        .image,
                                    replies: [],
                                    id: trip.questions!.length + 1),
                                trip.id!);
                            Navigator.pop(context);
                          }
                          // ignore: use_build_context_synchronously

                          ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
