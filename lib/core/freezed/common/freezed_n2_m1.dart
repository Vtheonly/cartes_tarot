import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_n2_m1.freezed.dart';

@freezed
class Freezed<T1, T2> with _$Freezed<T1, T2> {
  const factory Freezed.first({required T1 data}) = FirstFreezed;
  const factory Freezed.second({required T2 data}) = SecondFreezed;
}
