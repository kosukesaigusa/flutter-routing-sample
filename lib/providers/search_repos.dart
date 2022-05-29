import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/api/search_repo_response/search_repo_response.dart';
import '../services/search_repos.dart';

///
final defaultSearchWordProvider = Provider<String>((_) => 'flutter');

///
final searchWordStateProvider = StateProvider<String>((ref) {
  return ref.watch(defaultSearchWordProvider);
});

///
final isSearchingStateProvider = StateProvider.autoDispose<bool>((_) => false);

///
final searchReposFutureProvider = FutureProvider.autoDispose<SearchRepoResponse>((ref) async {
  return ref.read(searchReposServiceProvider).fetchRepos();
});
