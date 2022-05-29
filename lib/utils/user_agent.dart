import '../services/app_device_info.dart';

/// リクエストのヘッダの User-Agent に指定する文字列。
/// 例：
/// flutter-routing-sample/1.0.0 (10000) iOS iPhone
/// flutter-routing-sample/2.0.0 (10000) Android Redmi Note 9S
Future<String> get userAgent async {
  final i = await getDeviceInfo();
  return 'flutter-routing-sample/${i.version} (${i.buildNumber}) ${i.platform} ${i.deviceModel}';
}
