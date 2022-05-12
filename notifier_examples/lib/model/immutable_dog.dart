// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class ImmutableDog {
  final int dogAge;
  final String dogName;

  const ImmutableDog({required this.dogAge, required this.dogName});
  const ImmutableDog.initial()
      : dogAge = 1,
        dogName = 'Initial Dog';

  ImmutableDog copyWith({
    String? dogName,
    int? dogAge,
  }) {
    return ImmutableDog(
      dogAge: dogAge ?? this.dogAge,
      dogName: dogName ?? this.dogName,
    );
  }

  @override
  String toString() => 'ImmutableDog(dogAge: $dogAge, dogName: $dogName, hashCode: $hashCode)';
}
