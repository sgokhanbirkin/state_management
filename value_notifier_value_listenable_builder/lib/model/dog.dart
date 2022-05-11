// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dog {
  int dogAge;
  String dogName;
  Dog({
    required this.dogAge,
    required this.dogName,
  });

  Dog.initial()
      : dogAge = 1,
        dogName = 'Initial Dog';

  Dog copyWith({String? dogName, int? dogAge}) {
    return Dog(
      dogAge: dogAge ?? this.dogAge,
      dogName: dogName ?? this.dogName,
    );
  }

  @override
  String toString() => 'Dog(dogAge: $dogAge, dogName: $dogName, Hash: $hashCode)';
}
