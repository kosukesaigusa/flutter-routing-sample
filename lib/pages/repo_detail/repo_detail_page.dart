import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/repo/repo.dart';
import '../../providers/go_router_state.dart';
import '../../repositories/repo.dart';
import '../../utils/exceptions/base.dart';

/// state.extra に Repo インスタンスが見つかればすぐにそれを、
/// 見つからなければ state.params の情報をもとに通信をして Repo インスタンスを取得する
/// FutureProvider。
final repoFutureProvider = FutureProvider.autoDispose<Repo>(
  (ref) async {
    try {
      final state = ref.read(goRouterStateProvider);
      final repo = state.extra as Repo?;
      if (repo != null) {
        return repo;
      }
      final ownerName = state.params['owner']!;
      final repoName = state.params['repo']!;
      final getRepoResponse =
          await ref.read(repoRepositoryProvider).fetchRepo(owner: ownerName, repo: repoName);
      return getRepoResponse.repo;
    } on Exception {
      throw const AppException(message: 'Not found.');
    }
  },
  dependencies: [goRouterStateProvider],
);

///
class RepoDetailPage extends HookConsumerWidget {
  const RepoDetailPage({super.key});

  static const path = '/repo/:owner/:repo';
  static const name = 'RepoDetailPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repo Detail')),
      body: Column(
        children: <Widget>[
          ref.watch(repoFutureProvider).when<Widget>(
                data: (repo) => Text(repo.name),
                // TODO: エラーウィジェットを表示する
                error: (e, stackTrace) => const SizedBox(),
                loading: () => const SizedBox(),
              ),
        ],
      ),
    );
  }
}
