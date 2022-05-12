import 'package:flutter/material.dart';
import 'package:notifier_examples/model/immutable_dog.dart';
import 'package:notifier_examples/state_managment/state_notifiers/dog_state_notifier.dart';
import 'package:provider/provider.dart';

class DogNotifierView extends StatelessWidget {
  const DogNotifierView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DogStateNotifier>().setContext(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Dog age : ${context.watch<ImmutableDog>().dogAge}',
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DogStateNotifier>().growUp();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
