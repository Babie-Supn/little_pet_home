import 'package:models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pet.g.dart';
part 'pet.freezed.dart';

/// [User] will register some [Pet]s for fosterage
@freezed
class Pet with _$Pet {
  const Pet._();

  const factory Pet({
    required String name,
    required DateTime birth,
    required Gender gender,
    required String description,
    required Species species,
    Breeds? breeds,
    String? avatarUrl,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
