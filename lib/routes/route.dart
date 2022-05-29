import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';
import '../pages/not_found/not_found_page.dart';
import '../pages/todo_detail/todo_detail_page.dart';
import '../pages/todos/todos_page.dart';

final goRouter = GoRouter(
  initialLocation: HomePage.path,
  routes: <GoRoute>[
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => const HomePage(),
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
  // TODO: Understande difference between errorBuilder and errorPageBuilder
  //  https://gorouter.dev/transitions#errorpagebuilder-instead-of-errorbuilder
  // errorPageBuilder: (context, state) => const NotFoundPage(),
);
