import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_n4_m1.freezed.dart';

@freezed
class Freezed<T1, T2, T3, T4> with _$Freezed<T1, T2, T3, T4> {
  const factory Freezed.first({required T1 data}) = FirstFreezed;
  const factory Freezed.second({required T2 data}) = SecondFreezed;
  const factory Freezed.third({required T3 data}) = ThirdFreezed;
  const factory Freezed.fourth({required T4 data}) = FourthFreezed;
}
