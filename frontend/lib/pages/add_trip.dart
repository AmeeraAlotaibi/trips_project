import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/providers/trip_provider.dart';
import 'package:frontend/widgets/custom_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({Key? key}) : super(key: key);

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  var _image;
  final _picker = ImagePicker();
  // bool _rememberMe = false;
  var title = TextEditingController();
  var description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Trip")),
      floatingActionButton: CustomButton(
        onPressed: () async {
          await context.read<TripProvider>().createTrip(
                trip: Trip(
                    image: _image?.path,
                    title: title.text,
                    description: description.text),
              );
        },
        buttonText: "Add Trip",
        width: double.infinity,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        // physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = File(image!.path);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(color: Colors.blue[200]),
                  child: _image != null
                      ? Image.file(
                          _image,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          decoration: BoxDecoration(color: Colors.blue[200]),
                          width: 200,
                          height: 200,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
              // Trip Title
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2a3f34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Descriptoin:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2a3f34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: description,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: CustomButton(
              //     onPressed: () {},
              //     buttonText: "Add Trip",
              //     width: double.infinity,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
