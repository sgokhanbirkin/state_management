import 'package:flutter/material.dart';

import '../model/dog.dart';

class CustomInheritedWidget extends InheritedWidget {
  const CustomInheritedWidget({
    Key? key,
    required Widget child,
    required this.instance,
  }) : super(key: key, child: child);
  final ValueNotifier<Dog> instance;

  void growUp() {
    instance.value = instance.value.copyWith(dogAge: instance.value.dogAge + 1);
  }

  static CustomInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomInheritedWidget>() as CustomInheritedWidget;
  }

  @override
  bool updateShouldNotify(CustomInheritedWidget oldWidget) {
    return true;
  }
}
