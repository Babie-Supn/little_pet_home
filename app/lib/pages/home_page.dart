import 'package:little_pet_home/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10N.maybeOf(context) ?? L10N.current;
    final tabModel = TabModel(
      tabs: [
        const Tab(text: '推荐'),
        const Tab(text: '关注'),
      ],
      views: [
        const _RecommendListView(),
        const _FlowingListView(),
      ],
    );

    return DefaultTabController(
      length: tabModel.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.home),
          actions: [
            IconButton(
              onPressed: () => context.push(const MessagePage()),
              icon: const Icon(Icons.notifications_rounded),
            ),
          ],
          bottom: TabBar(tabs: tabModel.tabs),
        ),
        body: TabBarView(children: tabModel.views),
      ),
    );
  }
}

class _FlowingListView extends StatelessWidget {
  const _FlowingListView();

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}

class _RecommendListView extends StatelessWidget {
  const _RecommendListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => BasedListTile(
        key: Key('$index'),
        leading: BasedAvatar(
          image: CachedNetworkImageProvider(
            'https://avatars.githubusercontent.com/u/$index?v=4',
          ),
          placeholder: const AppIcon(size: 24),
        ),
      ),
    );
  }
}
