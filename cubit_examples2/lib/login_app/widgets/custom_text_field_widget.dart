import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      child: TextFormField(
        validator: (value) {
          return null;
        },
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          prefixIcon: Icon(prefixIcon, color: Colors.blue),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.blue),
          filled: true,
          fillColor: Colors.blue[50],
        ),
      ),
    );
  }
}
