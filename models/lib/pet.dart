import 'package:models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pet.g.dart';
part 'pet.freezed.dart';

@Freezed(unionKey: 'type')
class Pet with _$Pet {
  const Pet._();

  const factory Pet.cat({
    required String name,
    required DateTime birth,
    required Gender gender,
    required String description,
    required Cat type,
    String? avatarUrl,
  }) = PetCat;

  const factory Pet.dog({
    required String name,
    required DateTime birth,
    required Gender gender,
    required String description,
    required Dog type,
    String? avatarUrl,
  }) = PetDog;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
