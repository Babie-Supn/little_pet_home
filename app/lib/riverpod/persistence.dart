import 'package:little_pet_home/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'persistence.g.dart';

@Riverpod(keepAlive: true)
Persistence persistence(PersistenceRef ref) =>
    throw Exception('persistenceProvider not initialized');

/// [Persistence] abstracts the [SharedPreferences] layer
class Persistence {
  final SharedPreferences sp;
  static const prefix = 'little_pet_home';
  static const _spVersion = '${prefix}_spVersion';

  const Persistence._(this.sp);

  static Future<Persistence> init() async {
    SharedPreferences pref;
    try {
      pref = await SharedPreferences.getInstance();
    } catch (e) {
      throw Exception('Could not initialize SharedPreferences');
    }

    if (pref.getInt(_spVersion) == null) {
      await pref.setInt(_spVersion, 1);
    }

    return Persistence._(pref);
  }
}
