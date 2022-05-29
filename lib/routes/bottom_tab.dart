import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/repos/repos_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/todo_detail/todo_detail_page.dart';

///
final bottomTabs = <BottomTab>[
  BottomTab._(
    index: 0,
    label: 'GitHub',
    widget: const ReposPage(),
    path: ReposPage.path,
    iconData: FontAwesomeIcons.github,
    key: GlobalKey<NavigatorState>(),
  ),
  BottomTab._(
    index: 1,
    label: 'Settings',
    widget: const SettingsPage(),
    path: TodoDetailPage.path,
    iconData: FontAwesomeIcons.gear,
    key: GlobalKey<NavigatorState>(),
  ),
];

///
class BottomTab {
  const BottomTab._({
    required this.index,
    required this.label,
    required this.path,
    required this.widget,
    required this.iconData,
    required this.key,
  });

  final int index;
  final String label;
  final String path;
  final Widget widget;
  final IconData iconData;
  final GlobalKey<NavigatorState> key;

  ///
  static BottomTab getByIndex(int index) => bottomTabs.firstWhere(
        (b) => b.index == index,
        orElse: () => bottomTabs.first,
      );

  ///
  static BottomTab getByPath(String bottomTabPath) => bottomTabs.firstWhere(
        (b) => b.path == bottomTabPath,
        orElse: () => bottomTabs.first,
      );
}
