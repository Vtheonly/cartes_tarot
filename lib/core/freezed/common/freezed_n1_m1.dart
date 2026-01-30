import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_n1_m1.freezed.dart';

@freezed
abstract class Freezed<T> with _$Freezed<T> {
  const factory Freezed.first({required T data}) = FirstFreezed;
}
