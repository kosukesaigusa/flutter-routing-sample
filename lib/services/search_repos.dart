import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/api/search_repo_response/search_repo_response.dart';
import '../providers/search_repos.dart';
import '../repositories/search_repos.dart';

///
final searchReposServiceProvider = Provider.autoDispose((ref) => SearchReposService(ref.read));

///
class SearchReposService {
  SearchReposService(this._read);

  final Reader _read;

  ///
  Future<SearchRepoResponse> fetchRepos() async {
    try {
      final response = await _read(searchReposRepositoryProvider)
          .fetchRepositories(q: _read(searchWordStateProvider));
      return response;
    } finally {
      _read(isSearchingStateProvider.notifier).update((state) => false);
    }
  }
}
