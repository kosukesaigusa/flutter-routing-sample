import 'package:flutter/material.dart';

import 'routes/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: UniqueKey(),
      debugShowCheckedModeBanner: false,
      title: 'flutter-routing-sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      builder: (context, child) {
        return MediaQuery(
          // 端末依存のフォントスケールを 1 に固定する
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
  }
}
