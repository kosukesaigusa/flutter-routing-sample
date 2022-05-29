import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
class RepoDetailPage extends HookConsumerWidget {
  const RepoDetailPage({super.key});

  static const path = '/repo/:';
  static const name = 'RepoDetailPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repo Detail')),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
