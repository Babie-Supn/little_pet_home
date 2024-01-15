import 'package:test/test.dart';
import 'package:models/models.dart';

void main() {
  test('catCount', () {
    expect(Species.cat.breeds.length, 45);
  });
  test('dogCount', () {
    expect(Species.dog.breeds.length, 288);
  });
}
