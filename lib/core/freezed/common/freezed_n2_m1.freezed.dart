// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_n2_m1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Freezed<T1, T2> {
  Object? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T1 data) first,
    required TResult Function(T2 data) second,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T1 data)? first,
    TResult? Function(T2 data)? second,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T1 data)? first,
    TResult Function(T2 data)? second,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirstFreezed<T1, T2> value) first,
    required TResult Function(SecondFreezed<T1, T2> value) second,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T1, T2> value)? first,
    TResult? Function(SecondFreezed<T1, T2> value)? second,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T1, T2> value)? first,
    TResult Function(SecondFreezed<T1, T2> value)? second,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedCopyWith<T1, T2, $Res> {
  factory $FreezedCopyWith(
          Freezed<T1, T2> value, $Res Function(Freezed<T1, T2>) then) =
      _$FreezedCopyWithImpl<T1, T2, $Res, Freezed<T1, T2>>;
}

/// @nodoc
class _$FreezedCopyWithImpl<T1, T2, $Res, $Val extends Freezed<T1, T2>>
    implements $FreezedCopyWith<T1, T2, $Res> {
  _$FreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FirstFreezedImplCopyWith<T1, T2, $Res> {
  factory _$$FirstFreezedImplCopyWith(_$FirstFreezedImpl<T1, T2> value,
          $Res Function(_$FirstFreezedImpl<T1, T2>) then) =
      __$$FirstFreezedImplCopyWithImpl<T1, T2, $Res>;
  @useResult
  $Res call({T1 data});
}

/// @nodoc
class __$$FirstFreezedImplCopyWithImpl<T1, T2, $Res>
    extends _$FreezedCopyWithImpl<T1, T2, $Res, _$FirstFreezedImpl<T1, T2>>
    implements _$$FirstFreezedImplCopyWith<T1, T2, $Res> {
  __$$FirstFreezedImplCopyWithImpl(_$FirstFreezedImpl<T1, T2> _value,
      $Res Function(_$FirstFreezedImpl<T1, T2>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FirstFreezedImpl<T1, T2>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T1,
    ));
  }
}

/// @nodoc

class _$FirstFreezedImpl<T1, T2> implements FirstFreezed<T1, T2> {
  const _$FirstFreezedImpl({required this.data});

  @override
  final T1 data;

  @override
  String toString() {
    return 'Freezed<$T1, $T2>.first(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstFreezedImpl<T1, T2> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstFreezedImplCopyWith<T1, T2, _$FirstFreezedImpl<T1, T2>>
      get copyWith =>
          __$$FirstFreezedImplCopyWithImpl<T1, T2, _$FirstFreezedImpl<T1, T2>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T1 data) first,
    required TResult Function(T2 data) second,
  }) {
    return first(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T1 data)? first,
    TResult? Function(T2 data)? second,
  }) {
    return first?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T1 data)? first,
    TResult Function(T2 data)? second,
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
    required TResult Function(FirstFreezed<T1, T2> value) first,
    required TResult Function(SecondFreezed<T1, T2> value) second,
  }) {
    return first(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T1, T2> value)? first,
    TResult? Function(SecondFreezed<T1, T2> value)? second,
  }) {
    return first?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T1, T2> value)? first,
    TResult Function(SecondFreezed<T1, T2> value)? second,
    required TResult orElse(),
  }) {
    if (first != null) {
      return first(this);
    }
    return orElse();
  }
}

abstract class FirstFreezed<T1, T2> implements Freezed<T1, T2> {
  const factory FirstFreezed({required final T1 data}) =
      _$FirstFreezedImpl<T1, T2>;

  @override
  T1 get data;
  @JsonKey(ignore: true)
  _$$FirstFreezedImplCopyWith<T1, T2, _$FirstFreezedImpl<T1, T2>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SecondFreezedImplCopyWith<T1, T2, $Res> {
  factory _$$SecondFreezedImplCopyWith(_$SecondFreezedImpl<T1, T2> value,
          $Res Function(_$SecondFreezedImpl<T1, T2>) then) =
      __$$SecondFreezedImplCopyWithImpl<T1, T2, $Res>;
  @useResult
  $Res call({T2 data});
}

/// @nodoc
class __$$SecondFreezedImplCopyWithImpl<T1, T2, $Res>
    extends _$FreezedCopyWithImpl<T1, T2, $Res, _$SecondFreezedImpl<T1, T2>>
    implements _$$SecondFreezedImplCopyWith<T1, T2, $Res> {
  __$$SecondFreezedImplCopyWithImpl(_$SecondFreezedImpl<T1, T2> _value,
      $Res Function(_$SecondFreezedImpl<T1, T2>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SecondFreezedImpl<T1, T2>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T2,
    ));
  }
}

/// @nodoc

class _$SecondFreezedImpl<T1, T2> implements SecondFreezed<T1, T2> {
  const _$SecondFreezedImpl({required this.data});

  @override
  final T2 data;

  @override
  String toString() {
    return 'Freezed<$T1, $T2>.second(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecondFreezedImpl<T1, T2> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecondFreezedImplCopyWith<T1, T2, _$SecondFreezedImpl<T1, T2>>
      get copyWith => __$$SecondFreezedImplCopyWithImpl<T1, T2,
          _$SecondFreezedImpl<T1, T2>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T1 data) first,
    required TResult Function(T2 data) second,
  }) {
    return second(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T1 data)? first,
    TResult? Function(T2 data)? second,
  }) {
    return second?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T1 data)? first,
    TResult Function(T2 data)? second,
    required TResult orElse(),
  }) {
    if (second != null) {
      return second(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirstFreezed<T1, T2> value) first,
    required TResult Function(SecondFreezed<T1, T2> value) second,
  }) {
    return second(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T1, T2> value)? first,
    TResult? Function(SecondFreezed<T1, T2> value)? second,
  }) {
    return second?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T1, T2> value)? first,
    TResult Function(SecondFreezed<T1, T2> value)? second,
    required TResult orElse(),
  }) {
    if (second != null) {
      return second(this);
    }
    return orElse();
  }
}

abstract class SecondFreezed<T1, T2> implements Freezed<T1, T2> {
  const factory SecondFreezed({required final T2 data}) =
      _$SecondFreezedImpl<T1, T2>;

  @override
  T2 get data;
  @JsonKey(ignore: true)
  _$$SecondFreezedImplCopyWith<T1, T2, _$SecondFreezedImpl<T1, T2>>
      get copyWith => throw _privateConstructorUsedError;
}
