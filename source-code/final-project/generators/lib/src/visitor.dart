import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class Visitor extends SimpleElementVisitor<void> {
  // Class's name.
  late String className;

  // Map of variable name to its type.
  final Map<String, String> variables = {};

  @override
  void visitConstructorElement(ConstructorElement constructor) {
    final constructorReturnType = constructor.type.returnType.toString();

    // DartType ends with '*', which needs to be eliminated for the generated
    // code to be accurate.
    className = constructorReturnType.replaceFirst('*', '');
  }

  @override
  void visitFieldElement(FieldElement variable) {
    final variableType = variable.type.toString();

    // DartType ends with '*', which needs to be eliminated for the generated
    // code to be accurate.
    variables[variable.name] = variableType.replaceFirst('*', '');
  }
}
