import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);
  final String _title = 'Counter App';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: _Scaffold(title: _title),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: const _Body(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFloatingButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            title: 'Decrement',
            icon: Icons.remove,
          ),
          context.emptySizedWidthBoxLow,
          CustomFloatingButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            title: 'Increment',
            icon: Icons.add,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterInitial>(
      builder: (context, state) {
        return Center(
          child: Text('Number : ${context.watch<CounterCubit>().state.counterValue}'),
        );
      },
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key, required this.onPressed, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHigh,
      child: FloatingActionButton(
        heroTag: {'title': title},
        onPressed: onPressed,
        tooltip: title,
        child: Icon(icon),
      ),
    );
  }
}
