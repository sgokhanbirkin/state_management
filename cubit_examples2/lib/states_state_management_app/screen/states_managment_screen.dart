import 'package:cubit_examples2/states_state_management_app/cubit/sample_cubit.dart';
import 'package:cubit_examples2/states_state_management_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../widgets/button_widget.dart';

class StatesManagmentScreen extends StatefulWidget {
  const StatesManagmentScreen({Key? key}) : super(key: key);

  @override
  State<StatesManagmentScreen> createState() => _StatesManagmentScreenState();
}

class _StatesManagmentScreenState extends State<StatesManagmentScreen> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('States Managment'),
      ),
      body: Center(
        child: BlocBuilder<SampleCubit, SampleState>(
          builder: (context, state) {
            if (state is SampleInitial) {
              return buildInitialLayout();
            }
            if (state is SampleLoading) {
              return buildLoading();
            }
            if (state is SampleLoaded) {
              return buildLoadedLayout(state.data);
            }
            return buildErrorLayout();
          },
        ),
      ),
    );
  }

  Widget buildInitialLayout() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            textEditingController: _nameController,
          ),
          context.emptySizedHeightBoxLow3x,
          CustomButton(
            myFunction: () => submitData(_nameController.text),
            txtData: 'Save',
          ),
        ],
      );

  Widget buildLoading() => const CircularProgressIndicator();

  Widget buildLoadedLayout(String data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hi $data'),
          context.emptySizedHeightBoxLow3x,
          CustomButton(
            myFunction: () => navBack(),
            txtData: 'Restart',
          ),
        ],
      );

  Widget buildErrorLayout() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error'),
          context.emptySizedHeightBoxLow3x,
          CustomButton(
            myFunction: () => navBack(),
            txtData: 'Restart',
          ),
        ],
      );

  void submitData(String name) {
    BlocProvider.of<SampleCubit>(context).displayData(name);
  }

  void navBack() {
    BlocProvider.of<SampleCubit>(context).restartState();
  }
}
