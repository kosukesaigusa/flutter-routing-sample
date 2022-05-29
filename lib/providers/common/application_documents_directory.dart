import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

/// cookie や端末 ID の保存先としても使用する ApplicationDocumentDirectory のプロバイダ
final applicationDocumentsDirectoryProvider =
    Provider<Directory>((_) => throw UnimplementedError());
