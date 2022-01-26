import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_managment_progress/feature/login/view/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(11, 23, 84, 1),
        ),
      ),
    );
  }
}
