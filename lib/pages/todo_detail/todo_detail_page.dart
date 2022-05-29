import 'package:flutter/material.dart';

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({super.key});

  static const path = '/todo-detail';
  static const name = 'TodoDetailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Todo detail page'),
      ),
    );
  }
}
