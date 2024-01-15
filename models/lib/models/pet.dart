import 'package:models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pet.g.dart';
part 'pet.freezed.dart';

enum PetType {
  cat(CatBreed.values),
  dog(DogBreed.values);

  final List<Enum> breeds;

  const PetType(this.breeds);
}

@Freezed(unionKey: 'type')
class Pet with _$Pet {
  const Pet._();

  const factory Pet.cat({
    required String name,
    required DateTime birth,
    required Gender gender,
    required String description,
    required CatBreed breed,
    @Default(PetType.cat) PetType type,
    String? avatarUrl,
  }) = _PetCat;

  const factory Pet.dog({
    required String name,
    required DateTime birth,
    required Gender gender,
    required String description,
    required DogBreed breed,
    @Default(PetType.dog) PetType type,
    String? avatarUrl,
  }) = _PetDog;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
