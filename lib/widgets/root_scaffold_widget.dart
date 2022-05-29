import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/bottom_tab.dart';
import '../routes/bottom_tab.dart';
import '../routes/route.dart';
import '../services/scaffold_messenger.dart';

///
class RootScaffoldWidget extends StatefulHookConsumerWidget {
  const RootScaffoldWidget({super.key});

  @override
  ConsumerState<RootScaffoldWidget> createState() => _RootScaffoldWidgetState();
}

///
class _RootScaffoldWidgetState extends ConsumerState<RootScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: ScaffoldMessenger(
        key: ref.watch(scaffoldMessengerServiceProvider.select((c) => c.scaffoldMessengerKey)),
        child: Scaffold(
          body: Stack(
            children: [
              MaterialApp.router(
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
              ),
              // if (ref.watch(overlayLoadingProvider)) const OverlayLoadingWidget(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            onTap: _onTap,
            currentIndex: ref.watch(bottomTabStateProvider).index,
            items: bottomTabs
                .map(
                  (b) => BottomNavigationBarItem(
                    icon: Icon(b.iconData),
                    label: b.label,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  ///
  void _onTap(int index) {
    FocusScope.of(context).unfocus();
    final bottomTab = BottomTab.getByIndex(index);
    final currentBottomTab = ref.watch(bottomTabStateProvider);
    if (bottomTab == currentBottomTab) {
      bottomTab.key.currentState!.popUntil((route) => route.isFirst);
      return;
    }
    ref.read(bottomTabStateProvider.notifier).update((state) => bottomTab);
  }
}
