import 'dart:developer' as devtools show log;

import '../../views/users/user_page.dart';
import 'package:flutter/material.dart';

const url1 = 'http://10.0.2.2:5500/api/users1.json';
const url2 = 'http://10.0.2.2:5500/api/users2.json';

enum UserUrl { user1, user2 }

extension UserUrlExtension on UserUrl {
  String get urlToString {
    switch (this) {
      case UserUrl.user1:
        return url1;
      case UserUrl.user2:
        return url2;
    }
  }
}

extension IsEqualOrIgnoring<T> on Iterable<T> {
  bool isEqualOrIgnoring(Iterable<T> other) {
    return length == other.length && {...this}.intersection({...other}).length == length;
  }
}

extension Log on Object {
  void log() => devtools.log(toString());
}

extension SubScript<T> on Iterable<T> {
  T? operator [](int atIndex) => length > atIndex ? elementAt(atIndex) : null;
}

extension ItemToList<T> on Iterable<T> {
  Widget itemToWidget() => UserLitTile(users: this);
}
