import 'package:flutter/material.dart';
import 'package:value_notifier_value_listenable_builder/state_managment/value_notifiers/dog_value_notifier.dart';
import 'package:value_notifier_value_listenable_builder/views/value_notfier_view.dart';
import 'package:value_notifier_value_listenable_builder/widgets/custom_inherited_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInheritedWidget(
      instance: DogValueNotitier(),
      child: const MaterialApp(
        title: 'Material App',
        home: ValueNotiferView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class CustomInheritedWidgetwidget {}
