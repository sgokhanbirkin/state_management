import 'package:cubit_examples2/Routes/routes_generator.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RoutesView extends StatelessWidget {
  const RoutesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  RouteGenerator.generateRoute(
                    const RouteSettings(name: '/counterApp'),
                  ),
                );
              },
              child: const Text('Counter App'),
            ),
            context.emptySizedHeightBoxNormal,
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  RouteGenerator.generateRoute(
                    const RouteSettings(name: '/ageCalculator'),
                  ),
                );
              },
              child: const Text('Age Calculator App'),
            ),
            context.emptySizedHeightBoxNormal,
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  RouteGenerator.generateRoute(
                    const RouteSettings(name: '/statesManagmentApp'),
                  ),
                );
              },
              child: const Text('States Managment App'),
            ),
            context.emptySizedHeightBoxNormal,
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  RouteGenerator.generateRoute(
                    const RouteSettings(name: '/loginApp'),
                  ),
                );
              },
              child: const Text('Login App'),
            ),
          ],
        ),
      ),
    );
  }
}
