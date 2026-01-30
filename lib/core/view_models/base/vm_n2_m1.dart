import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class VM<T1, T2> extends Equatable {
  @protected
  final T1 e1;
  @protected
  final T2 e2;

  const VM({required this.e1, required this.e2});

  @override
  List<Object?> get props => [e1, e2];
}
