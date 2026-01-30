import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class VM<T> extends Equatable {
  @protected
  final T e;

  const VM({required this.e});

  @override
  List<Object?> get props => [e];
}
