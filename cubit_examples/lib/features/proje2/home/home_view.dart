import 'package:cubit_examples/features/proje2/home/names_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeViewProject2 extends StatelessWidget {
  const HomeViewProject2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NamesCubit>(
      create: (_) => NamesCubit(userList: _userList),
      child: const Project2View(),
    );
  }
}

class Project2View extends StatelessWidget {
  const Project2View({Key? key}) : super(key: key);

  final String title = 'Names Cubit Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<NamesCubit, String?>(
          builder: (context, name) {
            return Text(
              name ?? 'For name refresh click on button below',
              style: context.textTheme.headline3,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NamesCubit>().getRandomName();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

const Iterable<String> _userList = <String>[
  'Kennedi',
  'Jay',
  'Romaine',
  'Christian',
  'Angela',
  'Kathryn',
  'Kathleen',
  'Karen',
  'Nyasia',
];
