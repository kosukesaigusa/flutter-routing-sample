import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/api/search_repo_response/search_repo_response.dart';
import '../repositories/search_repos.dart';

///
final repoItemsScrollControllerProvider =
    Provider.autoDispose<ScrollController>((_) => ScrollController());

///
final defaultSearchWordProvider = Provider<String>((_) => 'flutter');

///
final defaultSearchPerPageProvider = Provider<int>((_) => 10);

///
final searchWordStateProvider = StateProvider<String>((ref) {
  return ref.watch(defaultSearchWordProvider);
});

///
final searchPageStateProvider = StateProvider<int>((ref) {
  return 1;
});

///
final searchPerPageStateProvider = StateProvider<int>((ref) {
  return ref.watch(defaultSearchPerPageProvider);
});

///
final isSearchingStateProvider = StateProvider.autoDispose<bool>((_) => false);

/// Search Repositories API をコールして、そのレスポンスを提供する FutureProvider。
final searchReposFutureProvider = FutureProvider.autoDispose<SearchReposResponse>((ref) async {
  final q = ref.read(searchWordStateProvider);
  final page = ref.read(searchPageStateProvider);
  final perPage = ref.read(searchPerPageStateProvider);
  try {
    final response = await ref.read(searchRepoRepositoryProvider).searchRepositories(
          q: q,
          page: page,
          perPage: perPage,
        );
    return response;
  } finally {
    ref.read(isSearchingStateProvider.notifier).update((state) => false);
  }
});
