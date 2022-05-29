import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/number.dart';
import '../../utils/dio_interceptors/connectivity_interceptor.dart';
import '../../utils/dio_interceptors/header_interceptor.dart';
import '../../utils/dio_interceptors/mock_interceptor.dart';
import '../../utils/dio_interceptors/request_interceptor.dart';
import '../../utils/dio_interceptors/response_interceptors.dart';
import 'application_documents_directory.dart';
import 'user_mock.dart';

/// CookieJar のプロバイダ
final cookieJarProvider = Provider<CookieJar>(
  (ref) => PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage(ref.read(applicationDocumentsDirectoryProvider).path),
  ),
);

/// Dio のインスタンスを各種設定を済ませた状態で提供するプロバイダ
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.httpClientAdapter = DefaultHttpClientAdapter();
  dio.options = BaseOptions(
    baseUrl: 'https://api.github.com',
    connectTimeout: connectionTimeoutMilliSeconds,
    receiveTimeout: receiveTimeoutMilliSeconds,
    validateStatus: (_) => true,
  );
  dio.interceptors.addAll(<Interceptor>[
    HeaderInterceptor(),
    CookieManager(ref.read(cookieJarProvider)),
    // デバッグモードでは RequestInterceptor を追加する
    if (kDebugMode) RequestInterceptor(),
    // デバッグモードでは ResponseInterceptor を追加
    if (kDebugMode) ResponseInterceptor(),
    // モックで動作させる場合は MockInterceptor を追加
    // モックで動作させない場合のみ ConnectivityInterceptor を追加
    if (ref.watch(useMockProvider)) MockInterceptor() else ConnectivityInterceptor(),
  ]);
  return dio;
});
