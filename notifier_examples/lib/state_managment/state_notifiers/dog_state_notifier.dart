import 'package:flutter/material.dart';
import 'package:notifier_examples/model/immutable_dog.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

class DogStateNotifier extends StateNotifier<ImmutableDog> with LocatorMixin, IViewModel {
  DogStateNotifier() : super(const ImmutableDog.initial());

  void growUp() {
    state = state.copyWith(dogAge: state.dogAge + 1);
    //debugPrint(state.toString());
  }

  @override
  set state(ImmutableDog value) {
    //read<LocatorService>().saveData(1, value.toString());

    context.read<LocatorService>().saveData(1, 'value');
    super.state = value;
  }

  @override
  setContext(BuildContext context) {
    this.context = context;
  }
}

abstract class ILocatorService {
  Future<void> saveData(int key, String value);
}

class LocatorService extends ILocatorService {
  @override
  Future<void> saveData(int key, String value) async {
    debugPrint("Kaydedilen Data Key: $key, Value: $value");
  }
}

abstract class IViewModel {
  late BuildContext context;
  setContext(BuildContext context);
}
