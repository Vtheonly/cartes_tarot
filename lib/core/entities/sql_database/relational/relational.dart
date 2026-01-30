import 'package:equatable/equatable.dart';

import 'relational_root.dart';

abstract class Relational<Core extends Equatable,
    RelationalIds extends Equatable> extends RelationalRoot<Core> {
  final RelationalIds relationalIds;

  const Relational({required super.coreData, required this.relationalIds});

  @override
  List<Object?> get props => [relationalIds, ...super.props];
}
