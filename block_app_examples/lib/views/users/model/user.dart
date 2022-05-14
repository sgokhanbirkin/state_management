// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

@immutable
class User {
  final int userId;
  final String firstname;
  final String email;

  const User({
    required this.userId,
    required this.firstname,
    required this.email,
  });

  User.fromJson(UserMap jsonData)
      : userId = jsonData['userId'],
        firstname = jsonData['first_name'],
        email = jsonData['email'];

  UserMap toJson() => {
        'userId': userId,
        'first_name': firstname,
        'email': email,
      };

  @override
  String toString() => 'User firstname: $firstname, email: $email';
}

typedef UserMap = Map<String, dynamic>;
