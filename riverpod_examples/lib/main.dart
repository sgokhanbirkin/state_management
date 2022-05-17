import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_examples/constant/constant.dart';
import 'package:riverpod_examples/view/splash_page.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.snackbarMessengerKey,
      theme: ThemeData(
        scaffoldBackgroundColor: Constant.white,
      ),
      home: const SplashPage(),
    );
  }
}
