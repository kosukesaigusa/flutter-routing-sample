import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/search_repos.dart';

///
final searchReposServiceProvider = Provider.autoDispose(SearchReposService.new);

///
class SearchReposService {
  SearchReposService(this._ref);

  final ProviderRef _ref;

  ///
  void updateSearchWord(String q) {
    _ref.read(isSearchingStateProvider.notifier).update((state) => true);
    _ref.read(searchWordStateProvider.notifier).update((state) => q);
    _ref.read(searchPageStateProvider.notifier).update((state) => 1);
    _animateToTop();
    _ref.refresh(searchReposFutureProvider);
  }

  ///
  void showPreviousPage() {
    _ref.read(isSearchingStateProvider.notifier).update((state) => true);
    _ref.read(searchPageStateProvider.notifier).update((state) => state - 1);
    _animateToTop();
    _ref.refresh(searchReposFutureProvider);
  }

  ///
  void showNextPage() {
    _ref.read(isSearchingStateProvider.notifier).update((state) => true);
    _ref.read(searchPageStateProvider.notifier).update((state) => state + 1);
    _animateToTop();
    _ref.refresh(searchReposFutureProvider);
  }

  ///
  void _animateToTop() {
    final sc = _ref.read(repoItemsScrollControllerProvider);
    if (!sc.hasClients) {
      return;
    }
    sc.animateTo(
      0,
      duration: const Duration(microseconds: 200),
      curve: Curves.linear,
    );
  }
}
