import 'package:cubit_examples2/age_calculator_app/cubit/agecalculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../widgets/button_widget.dart';
import '../widgets/input_field_widget.dart';
import '../widgets/text_widget.dart';

class AgeCalculatorScreen extends StatefulWidget {
  const AgeCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<AgeCalculatorScreen> createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  final String _title = 'Age Calculator App';
  late FocusNode calculateButtonFocusNode;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    calculateButtonFocusNode = FocusNode();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    calculateButtonFocusNode.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AgeCalculatorCubit, AgecalculatorInitial>(
              builder: (context, state) {
                return TextData(message: state.stageOfLife);
              },
            ),
            context.emptySizedHeightBoxNormal,
            InputField(
              focusNode: calculateButtonFocusNode,
              controller: ageController,
            ),
            context.emptySizedHeightBoxNormal,
            ButtonWidget(
              focusNode: calculateButtonFocusNode,
              controller: ageController,
            )
          ],
        ),
      ),
    );
  }
}
