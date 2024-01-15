import 'package:models/index.dart';

enum Species {
  cat,
  dog;

  Iterable<Breeds> get breeds => Breeds.values.where((e) => e.species == this);
}
