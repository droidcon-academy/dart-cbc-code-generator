// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// SerialisationGenerator
// **************************************************************************

Person _$PersonFromJson(Map json) => Person(
      name: json['name'] as String,
      age: json['age'] as int,
      codes: json['codes'] as bool,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'codes': instance.codes,
    };

// **************************************************************************
// CloneGenerator
// **************************************************************************

extension CloneExtension on Person {
  Person copyWith({
    String? name,
    int? age,
    bool? codes,
  }) =>
      Person(
        name: name ?? this.name,
        age: age ?? this.age,
        codes: codes ?? this.codes,
      );
}
