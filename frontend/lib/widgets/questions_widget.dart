import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({
    required this.asker_image,
    required this.owner_image,
    required this.question,
    required this.answer,
    Key? key,
  }) : super(key: key);
  final String asker_image;
  final String question;
  final String answer;
  final String owner_image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // QUESTION ROW
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[500],
              backgroundImage: NetworkImage(asker_image),
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
                      width: 240,
                      child: Text(
                        question,
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
              backgroundImage: NetworkImage(owner_image),
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
                        answer,
                        maxLines: 3,
                        style: TextStyle(
                          color: Color(0xFF2a3f34),
                          fontSize: 14,
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
          height: 25,
        ),
      ],
    );
  }
}
