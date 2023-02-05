// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeType _$PokeTypeFromJson(Map<String, dynamic> json) => PokeType(
      name: json['name'] as String?,
      id: json['id'] as int?,
      pokemon: (json['pokemon'] as List<dynamic>?)
          ?.map((e) => TypePokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokeTypeToJson(PokeType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pokemon': instance.pokemon,
    };
