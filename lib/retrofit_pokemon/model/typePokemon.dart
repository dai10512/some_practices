import 'package:json_annotation/json_annotation.dart';
import 'pokemon.dart';

part 'typePokemon.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TypePokemon {
  int? slot;
  Pokemon? pokemon;

  TypePokemon({this.slot, this.pokemon});

    factory TypePokemon.fromJson(Map<String, dynamic> json) =>
      _$TypePokemonFromJson(json);

  Map<String, dynamic> toJson() => _$TypePokemonToJson(this);
}