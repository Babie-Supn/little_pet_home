import 'package:little_pet_home/index.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabModel = TabModel(
      tabs: [
        Tab(
          text: Species.cat.name,
        ),
        Tab(
          text: Species.dog.name,
        ),
      ],
      views: [
        const _SpeciesDetailListView(species: Species.cat),
        const _SpeciesDetailListView(species: Species.dog),
      ],
    );

    return DefaultTabController(
      length: tabModel.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('分类'),
          actions: const [],
          bottom: TabBar(tabs: tabModel.tabs),
        ),
        body: TabBarView(
          children: tabModel.views,
        ),
      ),
    );
  }
}

class _SpeciesDetailListView extends StatelessWidget {
  const _SpeciesDetailListView({required this.species});
  final Species species;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: species.breeds.length,
      itemBuilder: (context, index) {
        final breeds = species.breeds.elementAt(index);
        return BasedListTile(
          key: Key(breeds.name),
          leading: const BasedAvatar(),
          titleText: breeds.name,
          onTap: () => context.push(
            _BreedsDetailPage(breeds: breeds),
          ),
        );
      },
    );
  }
}

class _BreedsDetailPage extends StatelessWidget {
  const _BreedsDetailPage({
    required this.breeds,
  });

  final Breeds breeds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breeds.name),
      ),
      body: Center(
        child: Text(breeds.name),
      ),
    );
  }
}
