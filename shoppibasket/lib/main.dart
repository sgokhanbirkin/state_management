import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/products/model/user_model.dart';
import 'package:shoppibasket/products/service/user_service.dart';

import 'features/tabs/shoppi_tab_view.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => User(context)),
          Provider<UserService>(create: (context) => UserService()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: ShoppiTabView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
