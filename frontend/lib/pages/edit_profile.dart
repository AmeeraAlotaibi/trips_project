// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/profile_provider.dart';
import 'package:frontend/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  var _image;
  final _picker = ImagePicker();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _userName = TextEditingController();
  final _bio = TextEditingController();
  String _date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  List<String> genders = ["Gender", "female", "male"];
  String selectedItem = "Gender";
  late final Profile profile;
  void initState() {
    super.initState();
    // add post frame callback to update the image
    profile = context.read<ProfileProvider>().profile;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _firstName.text = profile.first_name ?? "";
      _lastName.text = profile.last_name ?? "";
      _userName.text = profile.username ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR ------------------------------------
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF2a3f34),
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              // SAVE PROFILE FUNCTION HERE --------------
              _formKey.currentState!.save();
              Provider.of<ProfileProvider>(context, listen: false)
                  .updateProfile(Profile(
                first_name: _firstName.text,
                last_name: _lastName.text,
                birth_date: _date.toString(),
                gender: selectedItem,
                bio: _bio.text,
                image: _image != null ? _image.path : "",
              ));
              context.pop();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.done),
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _image = image?.path != null ? File(image!.path) : null;
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
                              : Image.network(
                                  profile.image!,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // first name and last name fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFormField(
                        width: 165,
                        controller: _firstName,
                        hintText: "first name",
                      ),
                      CustomFormField(
                        width: 165,
                        controller: _lastName,
                        hintText: "last name",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    width: 350,
                    controller: _userName,
                    hintText: "username",
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // FIRST DATE PICKER!!!!!!!!!!!!!
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Birth Date:",
                              style: TextStyle(
                                color: Color(0xFF2a3f34),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "${_date}",
                              style: const TextStyle(
                                color: Color(0xFF2a3f34),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              width: 150,
                              onPressed: () async {
                                DateTime? new_date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1901, 01, 01),
                                  lastDate: DateTime(2100, 01, 01),
                                );

                                // if user cancelled
                                if (new_date == null) return;
                                // if user picked a new date "OK"
                                setState(() {
                                  _date =
                                      DateFormat("yyyy-MM-dd").format(new_date);
                                  ;
                                  print(_date);
                                });
                              },
                              buttonText: "Pick date",
                            ),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Your Gender:",
                              style: TextStyle(
                                color: Color(0xFF2a3f34),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              selectedItem,
                              style: const TextStyle(
                                color: Color(0xFF2a3f34),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 150,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: const Color(0xFF5B8A72),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // DROPDOWN GENDER MENU =========================================
                              child: DropdownButton<String>(
                                dropdownColor: const Color(0xFF5B8A72),
                                underline: Container(
                                  height: 1,
                                  color: Colors
                                      .transparent, //<-- so the underline does not appear
                                ),
                                isExpanded:
                                    true, // <-- expands text so the arrow icon is at the end
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white, // <-- SEE HERE
                                ),
                                value: selectedItem,
                                items: genders
                                    .map((gender) => DropdownMenuItem<String>(
                                          value: gender,
                                          child: Text(
                                            gender,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (gender) =>
                                    setState(() => selectedItem = gender!),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // BIO ========================================
                  const Text(
                    "Bio:",
                    style: TextStyle(
                      color: Color(0xFF2a3f34),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    height: 125,
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: _bio,
                      decoration: InputDecoration(
                        hintText: "Write something about yourself...",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black38),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xFF5F7161),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
