import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/repo/repo.dart';
import '../../providers/search_repos.dart';
import '../../services/search_repos.dart';
import '../../utils/extensions/build_context.dart';
import '../../utils/extensions/int.dart';
import '../../utils/timer.dart';
import '../../widgets/shimmer.dart';

class ReposPage extends HookConsumerWidget {
  const ReposPage({super.key});

  static const path = '/repos';
  static const name = 'ReposPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Gap(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchRepoTextField(),
          ),
          RepoItemsWidget(),
        ],
      ),
    );
  }
}

///
class SearchRepoTextField extends StatefulHookConsumerWidget {
  const SearchRepoTextField({super.key});

  @override
  ConsumerState<SearchRepoTextField> createState() => _SearchRepoTextFieldState();
}

class _SearchRepoTextFieldState extends ConsumerState<SearchRepoTextField> {
  late TextEditingController _textEditingController;
  final debounce = Debounce(duration: const Duration(milliseconds: 2000));

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: (q) => debounce.run(
        () async {
          ref.read(searchWordStateProvider.notifier).update((state) => q);
          ref.read(isSearchingStateProvider.notifier).update((state) => true);
          await ref.read(searchReposServiceProvider).fetchRepos();
        },
      ),
      maxLines: 1,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
    );
  }
}

///
class RepoItemsWidget extends HookConsumerWidget {
  const RepoItemsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ref.watch(isSearchingStateProvider)
          ? _shimmerWidget
          : ref.watch(searchReposFutureProvider).when(
                // TODO: Show error widget
                error: (_, __) => const SizedBox(),
                loading: () => _shimmerWidget,
                data: (searchRepoResponse) {
                  final repos = searchRepoResponse.repos;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    itemCount: repos.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Search word: "${ref.watch(searchWordStateProvider)}"',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.bodySmall,
                              ),
                              const Gap(4),
                              Text(
                                'Total: ${searchRepoResponse.totalCount.withComma}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.bodySmall,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return RepoItemWidget(repo: repos[index - 1]);
                      }
                    },
                  );
                },
              ),
    );
  }

  Widget get _shimmerWidget => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: 10,
        itemBuilder: (_, __) => const RepoItemShimmerWidget(),
      );
}

///
class RepoItemWidget extends StatelessWidget {
  const RepoItemWidget({
    super.key,
    required this.repo,
  });

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FaIcon(FontAwesomeIcons.github),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repo.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.titleLarge,
                ),
                const Gap(4),
                Text(
                  repo.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodySmall,
                ),
                Text(
                  'Updated: ${repo.updatedAt.toString().substring(0, 10)}',
                  style: context.bodySmall,
                ),
              ],
            ),
          ),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 12),
                  const Gap(4),
                  Text(
                    repo.starGazersCount.withComma,
                  ),
                ],
              ),
              const Gap(4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.codeFork, size: 12),
                  const Gap(4),
                  Text(
                    repo.forksCount.withComma,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///
class RepoItemShimmerWidget extends StatelessWidget {
  const RepoItemShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FaIcon(FontAwesomeIcons.github),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerWidget.rectangular(
                  width: 120,
                  height: 16,
                  borderRadius: 8,
                ),
                const Gap(8),
                for (var i = 0; i < 2; i++) ...[
                  const ShimmerWidget.rectangular(
                    width: double.infinity,
                    height: 12,
                    borderRadius: 8,
                  ),
                  const Gap(8),
                ],
                const ShimmerWidget.rectangular(
                  width: 200,
                  height: 12,
                  borderRadius: 8,
                ),
              ],
            ),
          ),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              ShimmerWidget.rectangular(
                width: 100,
                height: 12,
                borderRadius: 8,
              ),
              Gap(8),
              ShimmerWidget.rectangular(
                width: 100,
                height: 12,
                borderRadius: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
