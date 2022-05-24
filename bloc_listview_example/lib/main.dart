import 'package:bloc_listview_example/views/home_page/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devtools show log;

void main() {
  BlocOverrides.runZoned(
    () => {
      runApp(const MyApp()),
    },
    blocObserver: PostBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class PostBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    'Bloc : $bloc'.log();
    super.onTransition(bloc, transition);
  }

  @override
  void onCreate(BlocBase bloc) {
    'Post Bloc Created'.log();
    super.onCreate(bloc);
  }
}

extension Log on Object {
  void log() => devtools.log(toString());
}
