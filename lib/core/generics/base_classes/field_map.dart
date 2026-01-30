import 'package:equatable/equatable.dart';

abstract class FieldMap<T> extends Equatable {
  final String name;
  final T value;

  const FieldMap({required this.name, required this.value});

  @override
  List<Object?> get props => [name, value];
}
