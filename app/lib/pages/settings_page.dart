import 'package:little_pet_home/index.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10N.maybeOf(context) ?? L10N.current;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: const BasedListView(
        children: [
          BasedListSection(
            titleText: '通用',
            children: [
              _EnableWatermarkListTile(),
              _CleanCacheListTile(),
            ],
          ),
          BasedListSection(
            titleText: '关于',
            children: [
              _VersionListTile(),
            ],
          ),
        ],
      ),
    );
  }
}

class _VersionListTile extends ConsumerWidget {
  const _VersionListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);

    return BasedListTile(
      leading: const AppIcon(size: 24),
      titleText: App.name,
      subtitleText: packageInfo.tagName,
    );
  }
}

class _EnableWatermarkListTile extends StatelessWidget {
  const _EnableWatermarkListTile();

  @override
  Widget build(BuildContext context) {
    return BasedSwitchListTile(
      value: false,
      onChanged: (value) {},
      leadingIcon: Icons.brush_rounded,
      titleText: '水印照片',
      subtitleText: '上传照片时添加水印',
    );
  }
}

class _CleanCacheListTile extends ConsumerWidget {
  const _CleanCacheListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paths = ref.watch(pathsProvider);
    return BasedListTile(
      leadingIcon: Icons.cleaning_services_rounded,
      titleText: '清理缓存',
      detailText: Bytes.format(bytes: paths.appCache.getBytes()),
      onTap: () async {
        final files = paths.appCache.listSync();
        for (final file in files) {
          file.delete(recursive: true);
        }
        ref.invalidate(pathsProvider);
      },
    );
  }
}
