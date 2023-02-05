// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_text_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokemonPageModelState {
  Ref<Object?> get ref => throw _privateConstructorUsedError;
  AsyncValue<dynamic> get textState => throw _privateConstructorUsedError;

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
  $Res call({Ref<Object?> ref, AsyncValue<dynamic> textState});
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
    Object? textState = null,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as Ref<Object?>,
      textState: null == textState
          ? _value.textState
          : textState // ignore: cast_nullable_to_non_nullable
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
  $Res call({Ref<Object?> ref, AsyncValue<dynamic> textState});
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
    Object? textState = null,
  }) {
    return _then(_$_PokemonPageModelState(
      null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as Ref<Object?>,
      textState: null == textState
          ? _value.textState
          : textState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<dynamic>,
    ));
  }
}

/// @nodoc

class _$_PokemonPageModelState implements _PokemonPageModelState {
  _$_PokemonPageModelState(this.ref,
      {this.textState = const AsyncValue.loading()});

  @override
  final Ref<Object?> ref;
  @override
  @JsonKey()
  final AsyncValue<dynamic> textState;

  @override
  String toString() {
    return 'PokemonPageModelState(ref: $ref, textState: $textState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonPageModelState &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.textState, textState) ||
                other.textState == textState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref, textState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonPageModelStateCopyWith<_$_PokemonPageModelState> get copyWith =>
      __$$_PokemonPageModelStateCopyWithImpl<_$_PokemonPageModelState>(
          this, _$identity);
}

abstract class _PokemonPageModelState implements PokemonPageModelState {
  factory _PokemonPageModelState(final Ref<Object?> ref,
      {final AsyncValue<dynamic> textState}) = _$_PokemonPageModelState;

  @override
  Ref<Object?> get ref;
  @override
  AsyncValue<dynamic> get textState;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonPageModelStateCopyWith<_$_PokemonPageModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
