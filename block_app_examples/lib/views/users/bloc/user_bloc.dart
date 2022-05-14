import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../core/extensions/app_extensions.dart';
import '../model/user.dart';

part 'fetch_result.dart';
part 'load_person.dart';

typedef PersonLoader = Future<List<User>> Function(UserUrl url);

class UserBloc extends Bloc<LoadAction, FetchResult?> {
  UserBloc() : super(null) {
    on<LoadPersonAction>(_onloadPerson);
  }
  final Map<UserUrl, Iterable<User>> _cached = {};

  Future<void> _onloadPerson(LoadPersonAction event, Emitter<FetchResult?> emit) async {
    final url = event.url;
    if (_cached.containsKey(url)) {
      final cachedUsers = _cached[url]!;
      final result = FetchResult(users: cachedUsers.toList(), isCache: true);
      'Data From Cache'.log();
      emit(result);
    } else {
      final personLoader = event.onLoader;
      final usersFromService = await personLoader(url);
      _cached[url] = usersFromService;
      'Data From Service'.log();
      emit(FetchResult(users: usersFromService, isCache: false));
    }
  }
}
