import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/api_client.dart';
import '../models/api/search_repo_response/search_repo_response.dart';
import '../utils/exceptions/base.dart';

final searchReposRepositoryProvider = Provider.autoDispose(
  (ref) => ReposRepository(client: ref.read(apiClientProvider)),
);

class ReposRepository {
  ReposRepository({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  /// 入力したキーワードで GET /search/repositories API をコールして、
  /// ヒットする GitHub リポジトリ一覧を含む SearchRepoResponse を返す。
  Future<SearchRepoResponse> fetchRepositories({
    required String q,
    int page = 1,
    int perPage = 10,
  }) async {
    final responseResult = await _client.get(
      '/search/repositories',
      queryParameters: <String, dynamic>{
        'q': q,
        'page': page,
        'per_page': perPage,
      },
    );
    return responseResult.when<SearchRepoResponse>(
      success: SearchRepoResponse.fromBaseResponseData,
      failure: (message) => throw AppException(message: message),
    );
  }
}
