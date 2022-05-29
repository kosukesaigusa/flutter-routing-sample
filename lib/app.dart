import 'package:flutter/material.dart';

import 'widgets/root_scaffold_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      home: const RootScaffoldWidget(),
    );
  }
}
