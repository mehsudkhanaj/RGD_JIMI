import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String hashedPassword;
  final String phoneNo;
  final String location;
  final String alertPhone;
  final String alertEmail;

  UserModel({
    required this.name,
    required this.email,
    required this.hashedPassword,
    required this.phoneNo,
    required this.location,
    required this.alertEmail,
    required this.alertPhone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        hashedPassword: json["hashedPassword"],
        phoneNo: json["phoneNo"],
        location: json["location"],
        alertEmail: json["alertEmail"],
        alertPhone: json["alertPhone"],
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'hashedPassword': hashedPassword,
      'phoneNo': phoneNo,
      'location': location,
      'alertEmail': alertEmail,
      'alertPhone': alertPhone,
    };
  }
}

void addUserToFirestore(UserModel user) {
  FirebaseFirestore.instance
      .collection('Users')
      .add(user.toMap())
      .then((value) {
    print('User added to Firestore!');
  }).catchError((error) {
    print('Failed to add user to Firestore: $error');
  });
}
