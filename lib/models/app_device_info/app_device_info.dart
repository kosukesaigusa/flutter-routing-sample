import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_device_info.freezed.dart';

@freezed
class AppDeviceInfo with _$AppDeviceInfo {
  const factory AppDeviceInfo({
    required String platform,
    required String version,
    required String buildNumber,
    String? deviceModel,
  }) = _AppDeviceInfo;
}
