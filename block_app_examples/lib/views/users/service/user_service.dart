import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'package:http/http.dart' as http;

import '../../../core/extensions/app_extensions.dart';
import '../model/user.dart';

typedef MyHttpClient = http.Client;

@immutable
class UserService {
  final MyHttpClient httpClient;
  UserService() : httpClient = MyHttpClient();

  Future<List<User>> fetchUser(UserUrl url) async {
    try {
      final response = await httpClient.get(Uri.parse(url.urlToString));
      return (json.decode(response.body) as List<dynamic>)
          .map((dynamic user) => User.fromJson(UserMap.from(user)))
          .cast<User>()
          .toList();
    } catch (e) {
      print(e);
      throw Exception('Failed to load user');
    }
  }
}
