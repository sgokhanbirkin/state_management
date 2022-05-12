import 'package:flutter/material.dart';

import '../widgets/custom_inherited_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  final String data = 'Details Page';

  @override
  Widget build(BuildContext context) {
    final dogInstance = CustomInheritedWidget.of(context).instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
      body: Center(
        child: Text(
          dogInstance.value.dogAge.toString(),
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
