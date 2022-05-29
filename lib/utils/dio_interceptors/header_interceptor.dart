import 'package:dio/dio.dart';

import '../../constants/string.dart';
import '../user_agent.dart';

/// ヘッダーに認証情報などを付加する
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor([this.overwriteUrl]);

  String? overwriteUrl;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Dio 経由のすべてのリクエストヘッダーに付加したい
    // キー・バリューを追加する。
    options.headers[referrer] = overwriteUrl ?? options.baseUrl;
    options.headers['Origin'] = options.baseUrl;
    options.headers['Accept'] = 'application/json';
    options.headers['User-Agent'] = await userAgent;
    return handler.next(options);
  }
}
