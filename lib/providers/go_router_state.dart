import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/exceptions/base.dart';

///
final goRouterStateProvider = Provider<GoRouterState>(
  (_) => throw const AppException(message: 'Required parameters are not found.'),
);
