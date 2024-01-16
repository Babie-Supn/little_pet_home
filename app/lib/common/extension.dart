import 'dart:math';
import 'package:little_pet_home/index.dart';

extension BuildContextExt on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) =>
      (splitViewKey.currentState ?? Navigator.of(this))
          .push(CupertinoPageRoute<T>(builder: (_) => page));

  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);

  Future<T?> pushDialog<T>(
    Widget dialog, {
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) =>
      (splitViewKey.currentState ?? Navigator.of(this)).push(
        DialogRoute(
          context: splitViewKey.currentState?.context ?? this,
          builder: (context) =>
              Material(type: MaterialType.transparency, child: dialog),
        ),
      );

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Brightness get brightness => colorScheme.brightness;
}

extension BrightnessExt on Brightness {
  bool get isDark => this == Brightness.dark;
  bool get isLight => this == Brightness.light;
}

abstract class Bytes {
  static String format({
    required int bytes,
    int decimals = 2,
  }) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}

extension FileSystemEntityExt on FileSystemEntity {
  int getBytes() {
    try {
      if (this is File) return File(path).lengthSync();
      if (this is Directory) return Directory(path).getBytes();
    } catch (e, s) {
      App.printLog('Can not get bytes', error: e, stackTrace: s);
    }
    return 0;
  }
}

extension DirectoryExt on Directory {
  int getBytes() {
    var sum = 0;
    for (final file in listSync()) {
      try {
        sum += file.getBytes();
      } catch (e, s) {
        App.printLog('Can not get bytes', error: e, stackTrace: s);
        sum += 0;
      }
    }
    return sum;
  }
}
