import 'package:little_pet_home/index.dart';

void main() => App.run();

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  Widget builder(context, child) => Column(
        children: [
          if (Platform.isWindows) const WindowAppBar(),
          Expanded(child: ClipRRect(child: child)),
        ],
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemes = ref.watch(colorSchemesProvider);
    final settings = ref.watch(settingsProvider);

    const appBarTheme = AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    );

    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: colorSchemes.light,
      datePickerTheme: const DatePickerThemeData(
        dayStyle: TextStyle(fontSize: 12),
      ),
      fontFamily: App.fontCascadiaCodePL,
      fontFamilyFallback: const [App.fontMiSans],
      appBarTheme: appBarTheme,
    );

    final darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorSchemes.dark,
      datePickerTheme: const DatePickerThemeData(
        dayStyle: TextStyle(fontSize: 12),
      ),
      fontFamily: App.fontCascadiaCodePL,
      fontFamilyFallback: const [App.fontMiSans],
      appBarTheme: appBarTheme,
    );

    setLocaleMessages(
      const Locale('zh', 'CN').toString(),
      ZhCnMessages(),
    );

    return MaterialApp(
      scrollBehavior: const _ScrollBehavior(),
      title: App.name,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: settings.themeMode,
      builder: builder,
      home: const BasedSplashPage(
        rootPage: RootPage(),
        appIcon: AppIcon(),
        appName: Text(
          App.name,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      localizationsDelegates: const [
        L10N.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh', 'CN'),
      ],
    );
  }
}

class _ScrollBehavior extends CupertinoScrollBehavior {
  const _ScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
