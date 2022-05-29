import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/bottom_tab.dart';
import '../routes/bottom_tab.dart';
import '../routes/route.dart';
import '../services/scaffold_messenger.dart';
import '../utils/extensions/build_context.dart';

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
                routeInformationParser: goRouter.routeInformationParser,
                routerDelegate: goRouter.routerDelegate,
                builder: (context, child) {
                  return MediaQuery(
                    // 端末依存のフォントスケールを 1 に固定する
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                    child: child!,
                  );
                },
                theme: ThemeData(primarySwatch: Colors.blue).copyWith(
                  // TODO: 必要なものをここで上書きする
                  // TODO: ダークテーマ対応を検討する
                  textTheme: TextTheme(
                    displayLarge: context.textTheme.displayLarge!
                        .copyWith(color: Colors.black87, fontSize: 36, fontWeight: FontWeight.w700),
                    displayMedium: context.textTheme.displayMedium!
                        .copyWith(color: Colors.black87, fontSize: 32, fontWeight: FontWeight.w700),
                    displaySmall: context.textTheme.displaySmall!
                        .copyWith(color: Colors.black87, fontSize: 28, fontWeight: FontWeight.w700),
                    headlineLarge: context.textTheme.headlineLarge!
                        .copyWith(color: Colors.black54, fontSize: 24, fontWeight: FontWeight.w700),
                    headlineMedium: context.textTheme.headlineMedium!
                        .copyWith(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w700),
                    headlineSmall: context.textTheme.headlineSmall!
                        .copyWith(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w700),
                    titleLarge: context.textTheme.titleLarge!
                        .copyWith(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
                    titleMedium: context.textTheme.titleMedium!
                        .copyWith(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600),
                    titleSmall: context.textTheme.titleSmall!
                        .copyWith(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w600),
                    bodyLarge:
                        context.textTheme.bodyLarge!.copyWith(color: Colors.black87, fontSize: 16),
                    bodyMedium:
                        context.textTheme.bodyMedium!.copyWith(color: Colors.black87, fontSize: 14),
                    bodySmall:
                        context.textTheme.bodySmall!.copyWith(color: Colors.black87, fontSize: 12),
                    labelLarge:
                        context.textTheme.labelLarge!.copyWith(color: Colors.black54, fontSize: 16),
                    labelMedium: context.textTheme.labelMedium!
                        .copyWith(color: Colors.black54, fontSize: 14),
                    labelSmall:
                        context.textTheme.labelSmall!.copyWith(color: Colors.black54, fontSize: 12),
                  ),
                  // textButtonTheme: TextButtonThemeData(
                  //   style: ButtonStyle(
                  //     textStyle: MaterialStateProperty.all<TextStyle>(
                  //       const TextStyle(color: Colors.white, fontSize: 16),
                  //     ),
                  //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  //     backgroundColor: MaterialStateProperty.all<Color>(ThemeData().primaryColor),
                  //     overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
                  //     // minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48)),
                  //   ),
                  // ),
                  // cardTheme: const CardTheme(
                  //   margin: EdgeInsets.all(0),
                  // ),
                ),
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
