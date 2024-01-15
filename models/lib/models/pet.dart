class Pet {
  const Pet({
    required this.name,
    required this.birth,
    required this.gender,
    required this.description,
    required this.type,
    this.avatarUrl,
  });

  final String name;
  final DateTime birth;
  final Gender gender;
  final String description;
  final Enum type;
  final String? avatarUrl;
}

class PetType {
  final Type type;

  const PetType({required this.type});

  static const cats = Cat.values;
  static const dogs = Dog.values;
}

enum Gender {
  male,
  female,
  others;
}

enum Cat {
  others;
}

enum Dog {
  others;
}
