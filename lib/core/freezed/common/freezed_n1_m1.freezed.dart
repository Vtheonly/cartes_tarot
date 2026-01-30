// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_n1_m1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Freezed<T> {
  T get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) first,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? first,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? first,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirstFreezed<T> value) first,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T> value)? first,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T> value)? first,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreezedCopyWith<T, Freezed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedCopyWith<T, $Res> {
  factory $FreezedCopyWith(Freezed<T> value, $Res Function(Freezed<T>) then) =
      _$FreezedCopyWithImpl<T, $Res, Freezed<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$FreezedCopyWithImpl<T, $Res, $Val extends Freezed<T>>
    implements $FreezedCopyWith<T, $Res> {
  _$FreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirstFreezedImplCopyWith<T, $Res>
    implements $FreezedCopyWith<T, $Res> {
  factory _$$FirstFreezedImplCopyWith(_$FirstFreezedImpl<T> value,
          $Res Function(_$FirstFreezedImpl<T>) then) =
      __$$FirstFreezedImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$FirstFreezedImplCopyWithImpl<T, $Res>
    extends _$FreezedCopyWithImpl<T, $Res, _$FirstFreezedImpl<T>>
    implements _$$FirstFreezedImplCopyWith<T, $Res> {
  __$$FirstFreezedImplCopyWithImpl(
      _$FirstFreezedImpl<T> _value, $Res Function(_$FirstFreezedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FirstFreezedImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$FirstFreezedImpl<T> implements FirstFreezed<T> {
  const _$FirstFreezedImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'Freezed<$T>.first(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstFreezedImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstFreezedImplCopyWith<T, _$FirstFreezedImpl<T>> get copyWith =>
      __$$FirstFreezedImplCopyWithImpl<T, _$FirstFreezedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) first,
  }) {
    return first(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? first,
  }) {
    return first?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? first,
    required TResult orElse(),
  }) {
    if (first != null) {
      return first(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirstFreezed<T> value) first,
  }) {
    return first(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T> value)? first,
  }) {
    return first?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T> value)? first,
    required TResult orElse(),
  }) {
    if (first != null) {
      return first(this);
    }
    return orElse();
  }
}

abstract class FirstFreezed<T> implements Freezed<T> {
  const factory FirstFreezed({required final T data}) = _$FirstFreezedImpl<T>;

  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$FirstFreezedImplCopyWith<T, _$FirstFreezedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
