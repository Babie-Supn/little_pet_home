import 'package:little_pet_home/index.dart';

final splitViewKey = GlobalKey<NavigatorState>();
final _leftWidgetKey = GlobalKey<_LeftWidgetState>();

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasedSplitView(
      navigatorKey: splitViewKey,
      leftWidget: _LeftWidget(key: _leftWidgetKey),
      rightPlaceholder: const Scaffold(
        body: Center(
          child: AppIcon(
            size: 128,
          ),
        ),
      ),
    );
  }
}

class _LeftWidget extends StatefulWidget {
  const _LeftWidget({super.key});

  @override
  State<_LeftWidget> createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<_LeftWidget> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10N.maybeOf(context) ?? L10N.current;

    final destinationModel = NavigationDestinationModel(
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home_rounded),
          label: l10n.home,
        ),
        const NavigationDestination(
          icon: Icon(Icons.category_rounded),
          label: '分类',
        ),
        const NavigationDestination(
          icon: Icon(Icons.person_rounded),
          label: '我的',
        ),
      ],
      bodies: [
        const HomePage(key: ValueKey(HomePage)),
        const CategoryPage(key: ValueKey(CategoryPage)),
        const SelfPage(key: ValueKey(SelfPage)),
      ],
    );

    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: Durations.medium2,
          child: destinationModel.bodies[_currentIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: destinationModel.destinations,
      ),
    );
  }
}
