import 'package:little_pet_home/index.dart';

class SelfPage extends StatelessWidget {
  const SelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          _QrButton(),
          _ThemeButton(),
          _SettingsButton(),
        ],
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.push(const SettingsPage()),
      icon: const Icon(Icons.settings_rounded),
    );
  }
}

class _QrButton extends StatelessWidget {
  const _QrButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.qr_code_scanner_rounded),
    );
  }
}

class _ThemeButton extends ConsumerWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final setSettings = ref.watch(settingsProvider.notifier);

    return IconButton(
      onPressed: setSettings.loopThemeMode,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Icon(
          key: ValueKey(settings.themeMode),
          App.themeModeIcon[settings.themeMode],
        ),
      ),
    );
  }
}
