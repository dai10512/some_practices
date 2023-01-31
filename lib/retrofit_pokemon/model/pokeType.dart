import 'package:json_annotation/json_annotation.dart';

import 'typePokemon.dart';

part 'pokeType.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokeType {
  int? id;
  String? name;
  List<TypePokemon>? pokemon;

  PokeType({this.name, this.id, this.pokemon});

  factory PokeType.fromJson(Map<String, dynamic> json) =>
      _$PokeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokeTypeToJson(this);
}
