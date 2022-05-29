import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'providers/common/application_documents_directory.dart';
import 'services/app_device_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: <Override>[
        applicationDocumentsDirectoryProvider.overrideWithValue(
          await getApplicationDocumentsDirectory(),
        ),
        appDeviceInfoProvider.overrideWithValue(
          await getAppDeviceInfo(),
        ),
      ],
      child: const App(),
    ),
  );
}
