import 'package:flutter/material.dart';

class ProjectInputs extends InputDecoration {
  const ProjectInputs(String title)
      : super(
          border: const OutlineInputBorder(),
          hintText: 'Name',
          focusColor: Colors.red,
          labelText: title,
        );
}
