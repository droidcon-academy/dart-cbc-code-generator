import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import 'package:annotations/annotations.dart';

import 'visitor.dart';

class CloneGenerator extends GeneratorForAnnotation<HelperAnnotation> {
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

    // Write clone extension.
    buffer.writeln('extension CloneExtension on ${className} {');

    // Write copyWith method.
    buffer.writeln('$className copyWith({');

    // Define the method parameters.
    for (final MapEntry<String, String> variable in visitor.variables.entries) {
      final String name = variable.key;
      final String type = variable.value;
      buffer.writeln('$type? $name,');
    }
    buffer.writeln('}) =>');

    // Return the class instance.
    buffer.writeln('$className(');

    // Fill in the constructor parameters.
    for (final MapEntry<String, String> variable in visitor.variables.entries) {
      final String name = variable.key;
      buffer.writeln('$name: $name ?? this.$name,');
    }
    buffer.writeln(');');

    // Close the extension.
    buffer.writeln('}');

    // Return final code.
    return buffer.toString();
  }
}
