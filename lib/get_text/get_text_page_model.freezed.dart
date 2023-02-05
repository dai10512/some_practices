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
mixin _$GetTextPageModelState {
  Ref<Object?> get ref => throw _privateConstructorUsedError;
  AsyncValue<dynamic> get textState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetTextPageModelStateCopyWith<GetTextPageModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTextPageModelStateCopyWith<$Res> {
  factory $GetTextPageModelStateCopyWith(GetTextPageModelState value,
          $Res Function(GetTextPageModelState) then) =
      _$GetTextPageModelStateCopyWithImpl<$Res, GetTextPageModelState>;
  @useResult
  $Res call({Ref<Object?> ref, AsyncValue<dynamic> textState});
}

/// @nodoc
class _$GetTextPageModelStateCopyWithImpl<$Res,
        $Val extends GetTextPageModelState>
    implements $GetTextPageModelStateCopyWith<$Res> {
  _$GetTextPageModelStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_GetTextPageModelStateCopyWith<$Res>
    implements $GetTextPageModelStateCopyWith<$Res> {
  factory _$$_GetTextPageModelStateCopyWith(_$_GetTextPageModelState value,
          $Res Function(_$_GetTextPageModelState) then) =
      __$$_GetTextPageModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ref<Object?> ref, AsyncValue<dynamic> textState});
}

/// @nodoc
class __$$_GetTextPageModelStateCopyWithImpl<$Res>
    extends _$GetTextPageModelStateCopyWithImpl<$Res, _$_GetTextPageModelState>
    implements _$$_GetTextPageModelStateCopyWith<$Res> {
  __$$_GetTextPageModelStateCopyWithImpl(_$_GetTextPageModelState _value,
      $Res Function(_$_GetTextPageModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? textState = null,
  }) {
    return _then(_$_GetTextPageModelState(
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

class _$_GetTextPageModelState implements _GetTextPageModelState {
  _$_GetTextPageModelState(this.ref,
      {this.textState = const AsyncValue.loading()});

  @override
  final Ref<Object?> ref;
  @override
  @JsonKey()
  final AsyncValue<dynamic> textState;

  @override
  String toString() {
    return 'GetTextPageModelState(ref: $ref, textState: $textState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTextPageModelState &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.textState, textState) ||
                other.textState == textState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref, textState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetTextPageModelStateCopyWith<_$_GetTextPageModelState> get copyWith =>
      __$$_GetTextPageModelStateCopyWithImpl<_$_GetTextPageModelState>(
          this, _$identity);
}

abstract class _GetTextPageModelState implements GetTextPageModelState {
  factory _GetTextPageModelState(final Ref<Object?> ref,
      {final AsyncValue<dynamic> textState}) = _$_GetTextPageModelState;

  @override
  Ref<Object?> get ref;
  @override
  AsyncValue<dynamic> get textState;
  @override
  @JsonKey(ignore: true)
  _$$_GetTextPageModelStateCopyWith<_$_GetTextPageModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
