import 'package:go_router/go_router.dart';

import '../pages/main/main_page.dart';
import '../pages/not_found/not_found_page.dart';
import '../pages/repos/repos_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/todo_detail/todo_detail_page.dart';
import '../pages/todos/todos_page.dart';

final goRouter = GoRouter(
  initialLocation: MainPage.path,
  routes: <GoRoute>[
    GoRoute(
      path: MainPage.path,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: ReposPage.path,
      builder: (context, state) => const ReposPage(),
    ),
    GoRoute(
      path: SettingsPage.path,
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: TodosPage.path,
      builder: (context, state) => const TodosPage(),
    ),
    GoRoute(
      path: TodoDetailPage.path,
      builder: (context, state) => const TodoDetailPage(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
  // TODO: Understand difference between errorBuilder and errorPageBuilder
  //  https://gorouter.dev/transitions#errorpagebuilder-instead-of-errorbuilder
  // errorPageBuilder: (context, state) => const NotFoundPage(),
);
