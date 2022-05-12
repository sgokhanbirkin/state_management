import 'package:flutter/material.dart';
import '../model/dog.dart';
import '../widgets/custom_inherited_widget.dart';
import 'details_page.dart';

class ValueNotiferView extends StatelessWidget {
  const ValueNotiferView({Key? key}) : super(key: key);
  final String _title = "Value Notifier Page";
  @override
  Widget build(BuildContext context) {
    //print('Build Çalıştı');
    //final ValueNotifier<int> _counter = ValueNotifier<int>(0);
    // final dogValueInstance = DogValueNotitier();
    final dogInstance = CustomInheritedWidget.of(context).instance;
    Function growUp = CustomInheritedWidget.of(context).growUp;
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // dogValueInstance.growUp();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailsPage()));
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              // ValueListenableBuilder(
              //   valueListenable: dogValueInstance,
              //   builder: (_, Dog instance, __) {
              //     return Text(
              //       'Dog Age: ${instance.dogAge} ',
              //       style: const TextStyle(fontSize: 20),
              //     );
              //   },
              // ),
              ValueListenableBuilder(
                valueListenable: dogInstance,
                builder: (_, Dog dog, __) {
                  return Text(
                    dog.dogAge.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //dogValueInstance.growUp();
            growUp();
          },
          child: const Icon(Icons.add),
        ));
  }
}

class _CounterFloatingActionButton extends StatelessWidget {
  const _CounterFloatingActionButton({
    Key? key,
    required ValueNotifier<int> counter,
  })  : _counter = counter,
        super(key: key);

  final ValueNotifier<int> _counter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                _counter.value++;
              },
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                _counter.value--;
              },
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  const _CounterWidget({
    Key? key,
    required ValueNotifier<int> counter,
  })  : _counter = counter,
        super(key: key);

  final ValueNotifier<int> _counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Counter',
            style: Theme.of(context).textTheme.headline3,
          ),
          ValueListenableBuilder<int>(
            valueListenable: _counter,
            builder: (_, value, __) {
              return Text(
                value.toString(),
                style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.blue),
              );
            },
          ),
        ],
      ),
    );
  }
}
