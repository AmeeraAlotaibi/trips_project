import 'package:frontend/models/user.dart';

class Profile {
  User user;
  String? gender;
  String? birthDate;
  String? image;
  String? bio;
  String dateJoined;
  
  Profile({
    required this.user,
     this.gender,
     this.birthDate,
     this.image,
     this.bio,
    required this.dateJoined,
  });
}
