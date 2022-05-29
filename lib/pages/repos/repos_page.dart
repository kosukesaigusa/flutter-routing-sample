import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/timer.dart';

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
      // onChanged: (q) => debounce.run(
      //   () => ref.read(searchRepoStateNotifierProvider.notifier).updateSearchWord(q),
      // ),
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
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const FaIcon(FontAwesomeIcons.github),
            title: Column(
              children: const <Widget>[],
            ),
            trailing: Column(
              children: const <Widget>[],
            ),
          );
        },
      ),
    );
  }
}
