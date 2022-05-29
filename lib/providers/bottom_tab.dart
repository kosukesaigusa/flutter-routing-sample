import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../routes/bottom_tab.dart';

///
final bottomTabStateProvider = StateProvider<BottomTab>((_) => bottomTabs[0]);
