import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceFormModel {
  final String email;
  final String phoneNo;
  final String description;
  final String name;

  ServiceFormModel(
      {required this.name,
      required this.description,
      required this.email,
      required this.phoneNo});

  Map<String, dynamic> toMap() {
    return {
      'name': email,
      'email': email,
      'phoneNo': phoneNo,
      'description': description,
    };
  }
}

void addServiceRequestToFirestore(ServiceFormModel serviceFormModel) {
  FirebaseFirestore.instance
      .collection('Services')
      .add(serviceFormModel.toMap())
      .then((value) {
    print('Services added to Firestore!');
  }).catchError((error) {
    print('Failed to add Services to Firestore: $error');
  });
}
