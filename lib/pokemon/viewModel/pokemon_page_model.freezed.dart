// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokemonPageModelState {
  Ref<Object?> get ref => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  AsyncValue<dynamic> get pokemonState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonPageModelStateCopyWith<PokemonPageModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonPageModelStateCopyWith<$Res> {
  factory $PokemonPageModelStateCopyWith(PokemonPageModelState value,
          $Res Function(PokemonPageModelState) then) =
      _$PokemonPageModelStateCopyWithImpl<$Res, PokemonPageModelState>;
  @useResult
  $Res call({Ref<Object?> ref, int count, AsyncValue<dynamic> pokemonState});
}

/// @nodoc
class _$PokemonPageModelStateCopyWithImpl<$Res,
        $Val extends PokemonPageModelState>
    implements $PokemonPageModelStateCopyWith<$Res> {
  _$PokemonPageModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? count = null,
    Object? pokemonState = null,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as Ref<Object?>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pokemonState: null == pokemonState
          ? _value.pokemonState
          : pokemonState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonPageModelStateCopyWith<$Res>
    implements $PokemonPageModelStateCopyWith<$Res> {
  factory _$$_PokemonPageModelStateCopyWith(_$_PokemonPageModelState value,
          $Res Function(_$_PokemonPageModelState) then) =
      __$$_PokemonPageModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ref<Object?> ref, int count, AsyncValue<dynamic> pokemonState});
}

/// @nodoc
class __$$_PokemonPageModelStateCopyWithImpl<$Res>
    extends _$PokemonPageModelStateCopyWithImpl<$Res, _$_PokemonPageModelState>
    implements _$$_PokemonPageModelStateCopyWith<$Res> {
  __$$_PokemonPageModelStateCopyWithImpl(_$_PokemonPageModelState _value,
      $Res Function(_$_PokemonPageModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? count = null,
    Object? pokemonState = null,
  }) {
    return _then(_$_PokemonPageModelState(
      null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as Ref<Object?>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pokemonState: null == pokemonState
          ? _value.pokemonState
          : pokemonState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<dynamic>,
    ));
  }
}

/// @nodoc

class _$_PokemonPageModelState implements _PokemonPageModelState {
  _$_PokemonPageModelState(this.ref,
      {this.count = 1, this.pokemonState = const AsyncValue.loading()});

  @override
  final Ref<Object?> ref;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final AsyncValue<dynamic> pokemonState;

  @override
  String toString() {
    return 'PokemonPageModelState(ref: $ref, count: $count, pokemonState: $pokemonState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonPageModelState &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.pokemonState, pokemonState) ||
                other.pokemonState == pokemonState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref, count, pokemonState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonPageModelStateCopyWith<_$_PokemonPageModelState> get copyWith =>
      __$$_PokemonPageModelStateCopyWithImpl<_$_PokemonPageModelState>(
          this, _$identity);
}

abstract class _PokemonPageModelState implements PokemonPageModelState {
  factory _PokemonPageModelState(final Ref<Object?> ref,
      {final int count,
      final AsyncValue<dynamic> pokemonState}) = _$_PokemonPageModelState;

  @override
  Ref<Object?> get ref;
  @override
  int get count;
  @override
  AsyncValue<dynamic> get pokemonState;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonPageModelStateCopyWith<_$_PokemonPageModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
