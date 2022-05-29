import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../todo_detail/todo_detail_page.dart';
import '../todos/todos_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static const path = '/';
  static const name = 'HomePage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () => context.push(TodosPage.path),
              child: const Text('Go to Todos page'),
            ),
            TextButton(
              onPressed: () => context.push(TodoDetailPage.path),
              child: const Text('Go to Todo detail page'),
            ),
            TextButton(
              onPressed: () => context.push('/random/path/foo/bar'),
              child: const Text('Go to NotFoundPage'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
