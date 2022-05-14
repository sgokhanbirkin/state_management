import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math show Random;

class NamesCubit extends Cubit<String?> {
  NamesCubit({required this.userList}) : super(null);

  final Iterable<String> userList;

  void getRandomName() => emit(userList.getRandomElement());
}

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}
