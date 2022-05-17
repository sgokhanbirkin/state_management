import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/agecalculator_cubit.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.focusNode, required this.controller}) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      focusNode: focusNode,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue, width: 2),
        minimumSize: const Size(175, 50),
      ),
      onPressed: () {
        BlocProvider.of<AgeCalculatorCubit>(context).updateAgeVal(int.parse(controller.text));
      },
      icon: const Icon(Icons.flutter_dash),
      label: const Text('Calculate'),
    );
  }
}
