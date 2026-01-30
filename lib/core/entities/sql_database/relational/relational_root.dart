import 'package:equatable/equatable.dart';

abstract class RelationalRoot<Core extends Equatable> extends Equatable {
  final Core coreData;

  const RelationalRoot({required this.coreData});

  @override
  List<Object?> get props => [coreData];
}
