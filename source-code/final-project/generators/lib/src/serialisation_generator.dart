import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import 'package:annotations/annotations.dart';

import 'visitor.dart';

class SerialisationGenerator extends GeneratorForAnnotation<HelperAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    // Visit the class to get its name and variables metadata.
    final Visitor visitor = Visitor();
    element.visitChildren(visitor);

    // Get the class name.
    final String className = visitor.className;

    // We use StringBuffer to write code line by line.
    final StringBuffer buffer = StringBuffer();

    // Write deserialisation method.
    buffer
        .writeln('$className _\$${className}FromJson(Map json) => $className(');

    // Fill in the constructor parameters.
    for (final MapEntry<String, String> variable in visitor.variables.entries) {
      final String name = variable.key;
      final String type = variable.value;
      buffer.writeln('$name: json[\'$name\'] as $type,');
    }

    // Close deserialisation method.
    buffer.writeln(');');

    buffer.writeln('');

    // Write serialisation method.
    buffer.writeln(
        'Map<String, dynamic> _\$${className}ToJson($className instance) => <String, dynamic>{');

    // Fill in the map entries.
    for (final MapEntry<String, String> variable in visitor.variables.entries) {
      final String name = variable.key;
      buffer.writeln('\'$name\': instance.$name,');
    }

    // Close serialisation method.
    buffer.writeln('};');

    // Return final code.
    return buffer.toString();
  }
}
