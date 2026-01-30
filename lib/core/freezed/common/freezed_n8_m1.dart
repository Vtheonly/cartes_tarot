import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_n8_m1.freezed.dart';

@freezed
class Freezed<T1, T2, T3, T4, T5, T6, T7, T8>
    with _$Freezed<T1, T2, T3, T4, T5, T6, T7, T8> {
  const factory Freezed.first({required T1 data}) = FirstFreezed;
  const factory Freezed.second({required T2 data}) = SecondFreezed;
  const factory Freezed.third({required T3 data}) = ThirdFreezed;
  const factory Freezed.fourth({required T4 data}) = FourthFreezed;
  const factory Freezed.fifth({required T5 data}) = FifthFreezed;
  const factory Freezed.sixth({required T6 data}) = SixthFreezed;
  const factory Freezed.seventh({required T7 data}) = SeventhFreezed;
  const factory Freezed.eighth({required T8 data}) = EighthFreezed;
}
