import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.txtData,
    required this.myFunction,
  }) : super(key: key);

  final String txtData;
  final Function myFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => myFunction(),
        child: Text(txtData),
      ),
    );
  }
}
