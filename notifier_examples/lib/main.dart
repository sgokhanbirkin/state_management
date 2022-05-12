import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:notifier_examples/model/immutable_dog.dart';
import 'package:notifier_examples/state_managment/state_notifiers/dog_state_notifier.dart';
import 'package:notifier_examples/views/dog_state_notifier_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => LocatorService()),
        StateNotifierProvider<DogStateNotifier, ImmutableDog>(create: (_) => DogStateNotifier()),
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: DogNotifierView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
