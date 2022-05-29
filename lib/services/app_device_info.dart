import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_device_info/app_device_info.dart';

///
final appDeviceInfoProvider = Provider<AppDeviceInfo>((_) => throw UnimplementedError());

///
Future<AppDeviceInfo> getAppDeviceInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return AppDeviceInfo(
    platform: Platform.isAndroid ? 'Android' : 'iOS',
    version: packageInfo.version,
    buildNumber: packageInfo.buildNumber,
    deviceModel: Platform.isAndroid
        ? (await DeviceInfoPlugin().androidInfo).model
        : (await DeviceInfoPlugin().iosInfo).model,
  );
}
