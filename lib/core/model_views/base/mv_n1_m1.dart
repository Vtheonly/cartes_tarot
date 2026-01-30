import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class MV<T> extends Equatable {
  @protected
  final T e;

  const MV({required this.e});

  @override
  List<Object?> get props => [e];
}
