// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_n4_m1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Freezed<T1, T2, T3, T4> {
  Object? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T1 data) first,
    required TResult Function(T2 data) second,
    required TResult Function(T3 data) third,
    required TResult Function(T4 data) fourth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T1 data)? first,
    TResult? Function(T2 data)? second,
    TResult? Function(T3 data)? third,
    TResult? Function(T4 data)? fourth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T1 data)? first,
    TResult Function(T2 data)? second,
    TResult Function(T3 data)? third,
    TResult Function(T4 data)? fourth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirstFreezed<T1, T2, T3, T4> value) first,
    required TResult Function(SecondFreezed<T1, T2, T3, T4> value) second,
    required TResult Function(ThirdFreezed<T1, T2, T3, T4> value) third,
    required TResult Function(FourthFreezed<T1, T2, T3, T4> value) fourth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult? Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult? Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult? Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedCopyWith<T1, T2, T3, T4, $Res> {
  factory $FreezedCopyWith(Freezed<T1, T2, T3, T4> value,
          $Res Function(Freezed<T1, T2, T3, T4>) then) =
      _$FreezedCopyWithImpl<T1, T2, T3, T4, $Res, Freezed<T1, T2, T3, T4>>;
}

/// @nodoc
class _$FreezedCopyWithImpl<T1, T2, T3, T4, $Res,
        $Val extends Freezed<T1, T2, T3, T4>>
    implements $FreezedCopyWith<T1, T2, T3, T4, $Res> {
  _$FreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FirstFreezedImplCopyWith<T1, T2, T3, T4, $Res> {
  factory _$$FirstFreezedImplCopyWith(_$FirstFreezedImpl<T1, T2, T3, T4> value,
          $Res Function(_$FirstFreezedImpl<T1, T2, T3, T4>) then) =
      __$$FirstFreezedImplCopyWithImpl<T1, T2, T3, T4, $Res>;
  @useResult
  $Res call({T1 data});
}

/// @nodoc
class __$$FirstFreezedImplCopyWithImpl<T1, T2, T3, T4, $Res>
    extends _$FreezedCopyWithImpl<T1, T2, T3, T4, $Res,
        _$FirstFreezedImpl<T1, T2, T3, T4>>
    implements _$$FirstFreezedImplCopyWith<T1, T2, T3, T4, $Res> {
  __$$FirstFreezedImplCopyWithImpl(_$FirstFreezedImpl<T1, T2, T3, T4> _value,
      $Res Function(_$FirstFreezedImpl<T1, T2, T3, T4>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FirstFreezedImpl<T1, T2, T3, T4>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T1,
    ));
  }
}

/// @nodoc

class _$FirstFreezedImpl<T1, T2, T3, T4>
    implements FirstFreezed<T1, T2, T3, T4> {
  const _$FirstFreezedImpl({required this.data});

  @override
  final T1 data;

  @override
  String toString() {
    return 'Freezed<$T1, $T2, $T3, $T4>.first(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstFreezedImpl<T1, T2, T3, T4> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstFreezedImplCopyWith<T1, T2, T3, T4,
          _$FirstFreezedImpl<T1, T2, T3, T4>>
      get copyWith => __$$FirstFreezedImplCopyWithImpl<T1, T2, T3, T4,
          _$FirstFreezedImpl<T1, T2, T3, T4>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T1 data) first,
    required TResult Function(T2 data) second,
    required TResult Function(T3 data) third,
    required TResult Function(T4 data) fourth,
  }) {
    return first(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T1 data)? first,
    TResult? Function(T2 data)? second,
    TResult? Function(T3 data)? third,
    TResult? Function(T4 data)? fourth,
  }) {
    return first?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T1 data)? first,
    TResult Function(T2 data)? second,
    TResult Function(T3 data)? third,
    TResult Function(T4 data)? fourth,
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
    required TResult Function(FirstFreezed<T1, T2, T3, T4> value) first,
    required TResult Function(SecondFreezed<T1, T2, T3, T4> value) second,
    required TResult Function(ThirdFreezed<T1, T2, T3, T4> value) third,
    required TResult Function(FourthFreezed<T1, T2, T3, T4> value) fourth,
  }) {
    return first(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult? Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult? Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult? Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
  }) {
    return first?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
    required TResult orElse(),
  }) {
    if (first != null) {
      return first(this);
    }
    return orElse();
  }
}

abstract class FirstFreezed<T1, T2, T3, T4> implements Freezed<T1, T2, T3, T4> {
  const factory FirstFreezed({required final T1 data}) =
      _$FirstFreezedImpl<T1, T2, T3, T4>;

  @override
  T1 get data;
  @JsonKey(ignore: true)
  _$$FirstFreezedImplCopyWith<T1, T2, T3, T4,
          _$FirstFreezedImpl<T1, T2, T3, T4>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SecondFreezedImplCopyWith<T1, T2, T3, T4, $Res> {
  factory _$$SecondFreezedImplCopyWith(
          _$SecondFreezedImpl<T1, T2, T3, T4> value,
          $Res Function(_$SecondFreezedImpl<T1, T2, T3, T4>) then) =
      __$$SecondFreezedImplCopyWithImpl<T1, T2, T3, T4, $Res>;
  @useResult
  $Res call({T2 data});
}

/// @nodoc
class __$$SecondFreezedImplCopyWithImpl<T1, T2, T3, T4, $Res>
    extends _$FreezedCopyWithImpl<T1, T2, T3, T4, $Res,
        _$SecondFreezedImpl<T1, T2, T3, T4>>
    implements _$$SecondFreezedImplCopyWith<T1, T2, T3, T4, $Res> {
  __$$SecondFreezedImplCopyWithImpl(_$SecondFreezedImpl<T1, T2, T3, T4> _value,
      $Res Function(_$SecondFreezedImpl<T1, T2, T3, T4>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SecondFreezedImpl<T1, T2, T3, T4>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T2,
    ));
  }
}

/// @nodoc

class _$SecondFreezedImpl<T1, T2, T3, T4>
    implements SecondFreezed<T1, T2, T3, T4> {
  const _$SecondFreezedImpl({required this.data});

  @override
  final T2 data;

  @override
  String toString() {
    return 'Freezed<$T1, $T2, $T3, $T4>.second(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecondFreezedImpl<T1, T2, T3, T4> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecondFreezedImplCopyWith<T1, T2, T3, T4,
          _$SecondFreezedImpl<T1, T2, T3, T4>>
      get copyWith => __$$SecondFreezedImplCopyWithImpl<T1, T2, T3, T4,
          _$SecondFreezedImpl<T1, T2, T3, T4>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T1 data) first,
    required TResult Function(T2 data) second,
    required TResult Function(T3 data) third,
    required TResult Function(T4 data) fourth,
  }) {
    return second(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T1 data)? first,
    TResult? Function(T2 data)? second,
    TResult? Function(T3 data)? third,
    TResult? Function(T4 data)? fourth,
  }) {
    return second?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T1 data)? first,
    TResult Function(T2 data)? second,
    TResult Function(T3 data)? third,
    TResult Function(T4 data)? fourth,
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
    required TResult Function(FirstFreezed<T1, T2, T3, T4> value) first,
    required TResult Function(SecondFreezed<T1, T2, T3, T4> value) second,
    required TResult Function(ThirdFreezed<T1, T2, T3, T4> value) third,
    required TResult Function(FourthFreezed<T1, T2, T3, T4> value) fourth,
  }) {
    return second(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult? Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult? Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult? Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
  }) {
    return second?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
    required TResult orElse(),
  }) {
    if (second != null) {
      return second(this);
    }
    return orElse();
  }
}

abstract class SecondFreezed<T1, T2, T3, T4>
    implements Freezed<T1, T2, T3, T4> {
  const factory SecondFreezed({required final T2 data}) =
      _$SecondFreezedImpl<T1, T2, T3, T4>;

  @override
  T2 get data;
  @JsonKey(ignore: true)
  _$$SecondFreezedImplCopyWith<T1, T2, T3, T4,
          _$SecondFreezedImpl<T1, T2, T3, T4>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThirdFreezedImplCopyWith<T1, T2, T3, T4, $Res> {
  factory _$$ThirdFreezedImplCopyWith(_$ThirdFreezedImpl<T1, T2, T3, T4> value,
          $Res Function(_$ThirdFreezedImpl<T1, T2, T3, T4>) then) =
      __$$ThirdFreezedImplCopyWithImpl<T1, T2, T3, T4, $Res>;
  @useResult
  $Res call({T3 data});
}

/// @nodoc
class __$$ThirdFreezedImplCopyWithImpl<T1, T2, T3, T4, $Res>
    extends _$FreezedCopyWithImpl<T1, T2, T3, T4, $Res,
        _$ThirdFreezedImpl<T1, T2, T3, T4>>
    implements _$$ThirdFreezedImplCopyWith<T1, T2, T3, T4, $Res> {
  __$$ThirdFreezedImplCopyWithImpl(_$ThirdFreezedImpl<T1, T2, T3, T4> _value,
      $Res Function(_$ThirdFreezedImpl<T1, T2, T3, T4>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ThirdFreezedImpl<T1, T2, T3, T4>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T3,
    ));
  }
}

/// @nodoc

class _$ThirdFreezedImpl<T1, T2, T3, T4>
    implements ThirdFreezed<T1, T2, T3, T4> {
  const _$ThirdFreezedImpl({required this.data});

  @override
  final T3 data;

  @override
  String toString() {
    return 'Freezed<$T1, $T2, $T3, $T4>.third(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThirdFreezedImpl<T1, T2, T3, T4> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThirdFreezedImplCopyWith<T1, T2, T3, T4,
          _$ThirdFreezedImpl<T1, T2, T3, T4>>
      get copyWith => __$$ThirdFreezedImplCopyWithImpl<T1, T2, T3, T4,
          _$ThirdFreezedImpl<T1, T2, T3, T4>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T1 data) first,
    required TResult Function(T2 data) second,
    required TResult Function(T3 data) third,
    required TResult Function(T4 data) fourth,
  }) {
    return third(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T1 data)? first,
    TResult? Function(T2 data)? second,
    TResult? Function(T3 data)? third,
    TResult? Function(T4 data)? fourth,
  }) {
    return third?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T1 data)? first,
    TResult Function(T2 data)? second,
    TResult Function(T3 data)? third,
    TResult Function(T4 data)? fourth,
    required TResult orElse(),
  }) {
    if (third != null) {
      return third(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirstFreezed<T1, T2, T3, T4> value) first,
    required TResult Function(SecondFreezed<T1, T2, T3, T4> value) second,
    required TResult Function(ThirdFreezed<T1, T2, T3, T4> value) third,
    required TResult Function(FourthFreezed<T1, T2, T3, T4> value) fourth,
  }) {
    return third(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult? Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult? Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult? Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
  }) {
    return third?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
    required TResult orElse(),
  }) {
    if (third != null) {
      return third(this);
    }
    return orElse();
  }
}

abstract class ThirdFreezed<T1, T2, T3, T4> implements Freezed<T1, T2, T3, T4> {
  const factory ThirdFreezed({required final T3 data}) =
      _$ThirdFreezedImpl<T1, T2, T3, T4>;

  @override
  T3 get data;
  @JsonKey(ignore: true)
  _$$ThirdFreezedImplCopyWith<T1, T2, T3, T4,
          _$ThirdFreezedImpl<T1, T2, T3, T4>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FourthFreezedImplCopyWith<T1, T2, T3, T4, $Res> {
  factory _$$FourthFreezedImplCopyWith(
          _$FourthFreezedImpl<T1, T2, T3, T4> value,
          $Res Function(_$FourthFreezedImpl<T1, T2, T3, T4>) then) =
      __$$FourthFreezedImplCopyWithImpl<T1, T2, T3, T4, $Res>;
  @useResult
  $Res call({T4 data});
}

/// @nodoc
class __$$FourthFreezedImplCopyWithImpl<T1, T2, T3, T4, $Res>
    extends _$FreezedCopyWithImpl<T1, T2, T3, T4, $Res,
        _$FourthFreezedImpl<T1, T2, T3, T4>>
    implements _$$FourthFreezedImplCopyWith<T1, T2, T3, T4, $Res> {
  __$$FourthFreezedImplCopyWithImpl(_$FourthFreezedImpl<T1, T2, T3, T4> _value,
      $Res Function(_$FourthFreezedImpl<T1, T2, T3, T4>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FourthFreezedImpl<T1, T2, T3, T4>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T4,
    ));
  }
}

/// @nodoc

class _$FourthFreezedImpl<T1, T2, T3, T4>
    implements FourthFreezed<T1, T2, T3, T4> {
  const _$FourthFreezedImpl({required this.data});

  @override
  final T4 data;

  @override
  String toString() {
    return 'Freezed<$T1, $T2, $T3, $T4>.fourth(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FourthFreezedImpl<T1, T2, T3, T4> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FourthFreezedImplCopyWith<T1, T2, T3, T4,
          _$FourthFreezedImpl<T1, T2, T3, T4>>
      get copyWith => __$$FourthFreezedImplCopyWithImpl<T1, T2, T3, T4,
          _$FourthFreezedImpl<T1, T2, T3, T4>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T1 data) first,
    required TResult Function(T2 data) second,
    required TResult Function(T3 data) third,
    required TResult Function(T4 data) fourth,
  }) {
    return fourth(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T1 data)? first,
    TResult? Function(T2 data)? second,
    TResult? Function(T3 data)? third,
    TResult? Function(T4 data)? fourth,
  }) {
    return fourth?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T1 data)? first,
    TResult Function(T2 data)? second,
    TResult Function(T3 data)? third,
    TResult Function(T4 data)? fourth,
    required TResult orElse(),
  }) {
    if (fourth != null) {
      return fourth(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirstFreezed<T1, T2, T3, T4> value) first,
    required TResult Function(SecondFreezed<T1, T2, T3, T4> value) second,
    required TResult Function(ThirdFreezed<T1, T2, T3, T4> value) third,
    required TResult Function(FourthFreezed<T1, T2, T3, T4> value) fourth,
  }) {
    return fourth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult? Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult? Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult? Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
  }) {
    return fourth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirstFreezed<T1, T2, T3, T4> value)? first,
    TResult Function(SecondFreezed<T1, T2, T3, T4> value)? second,
    TResult Function(ThirdFreezed<T1, T2, T3, T4> value)? third,
    TResult Function(FourthFreezed<T1, T2, T3, T4> value)? fourth,
    required TResult orElse(),
  }) {
    if (fourth != null) {
      return fourth(this);
    }
    return orElse();
  }
}

abstract class FourthFreezed<T1, T2, T3, T4>
    implements Freezed<T1, T2, T3, T4> {
  const factory FourthFreezed({required final T4 data}) =
      _$FourthFreezedImpl<T1, T2, T3, T4>;

  @override
  T4 get data;
  @JsonKey(ignore: true)
  _$$FourthFreezedImplCopyWith<T1, T2, T3, T4,
          _$FourthFreezedImpl<T1, T2, T3, T4>>
      get copyWith => throw _privateConstructorUsedError;
}
