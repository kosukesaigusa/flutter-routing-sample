import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/bottom_tab.dart';
import '../../routes/bottom_tab.dart';

class MainPage extends StatefulHookConsumerWidget {
  const MainPage({super.key});

  static const path = '/';
  static const name = 'MainPage';

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [for (final tab in bottomTabs) _buildStackedPages(tab)],
    );
  }

  ///
  Widget _buildStackedPages(BottomTab bottomTab) {
    final currentBottomTab = ref.watch(bottomTabStateProvider);
    return Offstage(
      offstage: bottomTab != currentBottomTab,
      child: TickerMode(
        enabled: bottomTab == currentBottomTab,
        child: currentBottomTab.widget,
      ),
    );
  }
}
