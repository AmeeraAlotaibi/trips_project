import 'package:frontend/models/user.dart';

class Trip {
  int? id;
  User owner;
  String title;
  String description;
  String? image;
  
  Trip({
    this.id,
    required this.owner,
    required this.title,
    required this.description,
    required this.image,
  });
}
