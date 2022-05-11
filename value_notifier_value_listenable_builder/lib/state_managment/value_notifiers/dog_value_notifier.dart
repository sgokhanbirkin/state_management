import 'package:flutter/material.dart';
import '../../model/dog.dart';

class DogValueNotitier extends ValueNotifier<Dog> {
  DogValueNotitier() : super(Dog.initial());

  void growUp() {
    //value.dogAge++;
    value = value.copyWith(dogAge: value.dogAge + 1);
    debugPrint(value.toString());
    //notifyListeners();
  }
}

class MyNotifier extends ChangeNotifier {}
