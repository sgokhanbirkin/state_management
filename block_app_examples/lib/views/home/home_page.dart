import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String data = 'Home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: _HomeScaffold(data: data),
    );
  }
}

class _HomeScaffold extends StatelessWidget {
  const _HomeScaffold({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select<HomeCubit, HomeTab>((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedTab == HomeTab.home ? 'Home' : 'Settings',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: IndexedStack(
          index: selectedTab.index,
          children: const [
            Text('Home'),
            Text('Settings'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeTabButton(value: HomeTab.home, selectedValue: selectedTab, icon: Icons.home),
            HomeTabButton(value: HomeTab.settings, selectedValue: selectedTab, icon: Icons.settings),
          ],
        ),
      ),
    );
  }
}

class HomeTabButton extends StatelessWidget {
  const HomeTabButton({
    Key? key,
    required this.value,
    required this.selectedValue,
    required this.icon,
  }) : super(key: key);
  final HomeTab value;
  final HomeTab selectedValue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      icon: Icon(
        icon,
        size: 32,
      ),
      color: selectedValue != value ? Colors.grey : Colors.blue,
    );
  }
}
