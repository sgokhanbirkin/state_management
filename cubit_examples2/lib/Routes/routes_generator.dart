import 'package:cubit_examples2/states_state_management_app/cubit/sample_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../age_calculator_app/cubit/agecalculator_cubit.dart';
import '../age_calculator_app/screen/age_calculator_screen.dart';
import '../counter_app/screen/counter_screen.dart';
import '../login_app/screen/login_page.dart';
import '../states_state_management_app/screen/states_managment_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/counterApp':
        return MaterialPageRoute(
          builder: (_) => const CounterScreen(),
        );
      case '/ageCalculator':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AgeCalculatorCubit>(
            create: (context) => AgeCalculatorCubit(),
            child: const AgeCalculatorScreen(),
          ),
        );
      case '/statesManagmentApp':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SampleCubit>(
            create: (context) => SampleCubit(),
            child: const StatesManagmentScreen(),
          ),
        );
      case '/loginApp':
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
