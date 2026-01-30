import 'package:equatable/equatable.dart';

abstract class CoreIds extends Equatable {
  final int id;

  const CoreIds({required this.id});

  @override
  List<Object?> get props => [id];
}
