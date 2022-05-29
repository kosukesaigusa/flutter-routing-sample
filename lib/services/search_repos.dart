import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/search_repos.dart';

///
final searchReposServiceProvider = Provider.autoDispose(SearchReposService.new);

///
class SearchReposService {
  SearchReposService(this._ref);

  // final Reader _read;
  final ProviderRef _ref;

  ///
  void refresh() {
    _ref.read(isSearchingStateProvider.notifier).update((state) => true);
    _animateToTop();
    _ref.refresh(searchReposFutureProvider);
  }

  /// ページ切替時に ListView の上までスクロールする
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
