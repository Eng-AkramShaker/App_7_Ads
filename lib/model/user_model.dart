// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class User_Model {
  final String uid;
  final String username;
  final String email;
  final DateTime createdAt;

  User_Model({
    required this.uid,
    required this.username,
    required this.email,
    required this.createdAt,
  });

  factory User_Model.fromMap(Map<String, dynamic> data, String uid) {
    return User_Model(
      uid: uid,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'createdAt': createdAt,
    };
  }
}
