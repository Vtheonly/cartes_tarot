import 'package:equatable/equatable.dart';

abstract class TypedList<T> extends Equatable {
  final List<T> values;

  const TypedList({required this.values});

  @override
  List<Object?> get props => [values];
}
