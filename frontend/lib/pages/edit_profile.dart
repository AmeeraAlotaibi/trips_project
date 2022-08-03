import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var _image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR ------------------------------------
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF2a3f34),
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              // SAVE PROFILE FUNCTION HERE --------------
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.done),
            ),
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = File(image!.path);
                  });
                },
                child: ClipOval(
                  child: Container(
                    width: 125,
                    height: 125,
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
              ),
            ],
          )
        ]),
      ),
    );
  }
}
