import 'package:annotations/annotations.dart';

part 'person.g.dart';

@helperMethods
class Person {
  final String name;
  final int age;
  final bool codes;

  Person({
    required this.name,
    required this.age,
    required this.codes,
  });

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  factory Person.fromJson(Map json) => _$PersonFromJson(json);
}
