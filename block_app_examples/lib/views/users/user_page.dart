import 'service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../core/extensions/app_extensions.dart';
import 'bloc/user_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (_) => UserBloc(),
      child: const UserView(),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            BlocBuilder<UserBloc, FetchResult?>(
              builder: (context, FetchResult? fetchResult) {
                return fetchResult != null
                    ? fetchResult.users.itemToWidget()
                    : const Center(
                        child: Text('Null '),
                      );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: context.paddingLow,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FetchUserButton(url: UserUrl.user1, text: '1'),
            context.emptySizedWidthBoxLow,
            const FetchUserButton(url: UserUrl.user2, text: '2'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class FetchUserButton extends StatelessWidget {
  const FetchUserButton({Key? key, required this.url, required this.text}) : super(key: key);
  final UserUrl url;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<UserBloc>().add(
              LoadPersonAction(
                url: url,
                onLoader: UserService().fetchUser,
              ),
            );
      },
      child: Text(text),
    );
  }
}

class UserLitTile<T> extends StatelessWidget {
  const UserLitTile({Key? key, required this.users}) : super(key: key);
  final Iterable<T> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            users[index].toString(),
          ),
        );
      },
    );
  }
}
