import 'package:flutter/material.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  static const path = '/todos';
  static const name = 'TodosPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Todos page'),
      ),
    );
  }
}
