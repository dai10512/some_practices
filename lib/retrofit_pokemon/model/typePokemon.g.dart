// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typePokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypePokemon _$TypePokemonFromJson(Map<String, dynamic> json) => TypePokemon(
      slot: json['slot'] as int?,
      pokemon: json['pokemon'] == null
          ? null
          : Pokemon.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypePokemonToJson(TypePokemon instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'pokemon': instance.pokemon,
    };
