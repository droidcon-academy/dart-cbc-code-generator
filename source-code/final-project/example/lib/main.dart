import 'package:example/person.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CodeGenerationExample());

class CodeGenerationExample extends StatelessWidget {
  const CodeGenerationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Generation Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize a Person object with default values.
  Person person = Person(name: 'John', age: 25, codes: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Code Generation Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Table(
            children: [
              getTableRow('Name', person.name),
              getTableRow('Age', person.age.toString()),
              getTableRow('Codes', person.codes.toString()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeName,
        tooltip: 'Change Name',
        child: const Icon(Icons.change_circle),
      ),
    );
  }

  TableRow getTableRow(String key, String value) {
    return TableRow(
      children: [
        TableCell(text: key),
        TableCell(text: value),
      ],
    );
  }

  void _changeName() {
    setState(() {
      person = person.copyWith(name: 'Alex');
    });
  }
}

class TableCell extends StatelessWidget {
  final String text;

  const TableCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
      child: Text(text, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
